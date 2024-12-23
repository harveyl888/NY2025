local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = "charades",
    version = "0.0.1",
    stylesheets = { "assets/css/style.css" },
    scripts = { "assets/js/script.js" }
  })
end

return {
  ["tonguetwisters"] = function(args, kwargs, meta)

    local tonguetwisters = ""

    -- Extract tongue twisters and add them to the array
    if meta.tonguetwisters then
      for _, tt in ipairs(meta.tonguetwisters) do
        tonguetwisters = tonguetwisters .. '"' .. pandoc.utils.stringify(tt) .. '"' .. ","
      end
      tonguetwisters = string.sub(tonguetwisters, 1, -2)

      ensureHtmlDeps()
      return pandoc.RawBlock('html', '<button id="tonguetwister_but" type="button" class="btn btn-danger" data-array=\'[' .. pandoc.utils.stringify(tonguetwisters) .. ']\' onclick="array_choose(\'tonguetwister\')">New Tongue Twister</button>' ..
      '<div><p id="tonguetwister_text" class="text-danger bigger-text"></p></div>')

    else
      return pandoc.RawBlock('html', '<div></div>')
    end
  end,


  ["charades"] = function(args, kwargs, meta)

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
      return pandoc.RawBlock('html', '<button id="charade_but" type="button" class="btn btn-info" data-array=\'[' .. pandoc.utils.stringify(charades_all) .. ']\' onclick="array_choose(\'charade\')">New Charade</button>' ..
      '<div><p id="charade_text" class="text-info bigger-text"></p></div>')
    else
      return pandoc.RawBlock('html', '<div></div>')
    end
  end
}


