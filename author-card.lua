-- Wraps each page in a two-column layout: the author card on the left,
-- the page content on the right. The card is built from the `profile`
-- settings in _profile.yml.

local function esc(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

local function str(v)
  if v == nil then return "" end
  return pandoc.utils.stringify(v)
end

local function build_card(profile)
  -- Make image paths work from pages in subfolders too
  local offset = quarto.project.offset or "."
  local photo = str(profile.photo)
  local html = { '<div class="author-card">' }
  if photo ~= "" then
    table.insert(html, '<img class="author-photo" src="' .. offset .. '/' .. esc(photo) .. '" alt="Photo of ' .. esc(str(profile.name)) .. '">')
  end
  table.insert(html, '<p class="author-name">' .. esc(str(profile.name)) .. '</p>')
  if str(profile.title) ~= "" then
    table.insert(html, '<p class="author-bio">' .. esc(str(profile.title)) .. '</p>')
  end
  table.insert(html, '<ul class="author-links">')
  if str(profile.location) ~= "" then
    table.insert(html, '<li><i class="bi bi-geo-alt-fill"></i>' .. esc(str(profile.location)) .. '</li>')
  end
  for _, link in ipairs(profile.links or {}) do
    table.insert(html, '<li><a href="' .. esc(str(link.url)) .. '"><i class="bi bi-' .. esc(str(link.icon)) .. '"></i>' .. esc(str(link.text)) .. '</a></li>')
  end
  table.insert(html, '</ul></div>')
  return table.concat(html, "\n")
end

function Pandoc(doc)
  if not quarto.doc.is_format("html") or not doc.meta.profile then return doc end
  local blocks = pandoc.List({
    pandoc.RawBlock("html", '<div class="page-grid">' .. build_card(doc.meta.profile) .. '<div class="page-main">')
  })
  blocks:extend(doc.blocks)
  blocks:insert(pandoc.RawBlock("html", "</div></div>"))
  doc.blocks = blocks
  return doc
end
