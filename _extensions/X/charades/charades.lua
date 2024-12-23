local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = "charades",
    version = "0.0.1",
    stylesheets = { "assets/css/style.css" },
    scripts = { "assets/js/script.js" }
  })
end

function charades(args, kwargs, meta)

  -- Check if charades metadata exists
  if meta.charades then
    local charades = meta.charades
    local charades_all = ""

    -- Extract movies and songs and add them to the array
    if charades.movies then
      for _, movie in ipairs(charades.movies) do
        charades_all = charades_all .. '"' .. pandoc.utils.stringify(movie) .. ' (Movie)"' .. ","
      end
    end
    if charades.songs then
      for _, song in ipairs(charades.songs) do
        charades_all = charades_all .. '"' .. pandoc.utils.stringify(song) .. ' (Song)"' .. ","
      end
    end
    charades_all = string.sub(charades_all, 1, -2)


    ensureHtmlDeps()
    return pandoc.RawBlock('html', '<button id="charade_but" type="button" class="btn btn-info" data-array=\'[' .. pandoc.utils.stringify(charades_all) .. ']\' onclick="charades_choose()">New Charade</button>' ..
    '<div><p id="charade_text" class="text-info bigger-text"></p></div>')
  else
    return pandoc.RawBlock('html', '<div></div>')
  end
end
