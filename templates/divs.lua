-- =============================================================================
-- Pandoc Lua Filter: divs.lua
-- Converts fenced divs to LaTeX environments for callouts and placeholders
-- =============================================================================

-- Callout types we support
local callout_types = {
  note = true,
  tip = true,
  warning = true,
  important = true
}

-- Handle Div elements
function Div(el)
  -- Get the first class (div type)
  local div_type = el.classes[1]
  
  if not div_type then
    return nil
  end
  
  -- Handle callouts (note, tip, warning, important)
  if callout_types[div_type] then
    local content = pandoc.write(pandoc.Pandoc(el.content), 'latex')
    return pandoc.RawBlock('latex',
      '\\begin{' .. div_type .. '}\n' ..
      content ..
      '\\end{' .. div_type .. '}'
    )
  end
  
  -- Handle image-placeholder
  if div_type == 'image-placeholder' then
    -- Extract text content from the div
    local text_content = pandoc.utils.stringify(el.content)
    
    -- Escape special LaTeX characters
    text_content = text_content:gsub('%%', '\\%%')
    text_content = text_content:gsub('&', '\\&')
    text_content = text_content:gsub('#', '\\#')
    text_content = text_content:gsub('_', '\\_')
    
    return pandoc.RawBlock('latex',
      '\\begin{imageplaceholder}\n' ..
      text_content ..
      '\n\\end{imageplaceholder}'
    )
  end
  
  -- Return unchanged if not a known type
  return nil
end

-- Handle Table elements to move captions below
function Table(el)
  -- Only modify for FORMAT == 'latex'
  if FORMAT ~= 'latex' then
    return nil
  end

  -- Only process if there's a caption
  if not el.caption or #el.caption.long == 0 then
    return nil
  end

  -- Get caption text
  local caption_text = pandoc.write(pandoc.Pandoc(el.caption.long), 'latex')

  -- Create a table without caption to avoid double-counting
  local table_without_caption = el:clone()
  table_without_caption.caption = pandoc.Caption()

  -- Generate the table LaTeX without caption
  local table_latex = pandoc.write(pandoc.Pandoc({table_without_caption}), 'latex')

  -- Add caption after \end{longtable} with minimal spacing
  table_latex = table_latex:gsub('(\\end{longtable})',
    '%1\n\\vspace{2pt}\n\\captionof{table}{' .. caption_text .. '}')

  return pandoc.RawBlock('latex', table_latex)
end

return {
  { Div = Div },
  { Table = Table }
}
