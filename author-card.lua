-- Wraps each page in a two-column layout: the author card from
-- _author.html on the left, the page content on the right.

local function read_card()
  local path = quarto.project.directory .. "/_author.html"
  local f = io.open(path, "r")
  if not f then return "" end
  local html = f:read("a")
  f:close()
  -- Make image paths work from pages in subfolders too
  local offset = quarto.project.offset or "."
  return (html:gsub('src="images/', 'src="' .. offset .. '/images/'))
end

function Pandoc(doc)
  if not quarto.doc.is_format("html") then return doc end
  local blocks = pandoc.List({
    pandoc.RawBlock("html", '<div class="page-grid">' .. read_card() .. '<div class="page-main">')
  })
  blocks:extend(doc.blocks)
  blocks:insert(pandoc.RawBlock("html", "</div></div>"))
  doc.blocks = blocks
  return doc
end
