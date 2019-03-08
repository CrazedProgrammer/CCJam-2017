(import lua/basic (_G))

(defun create ()
  (with (term ((.> _G :term :current)))
    { :getSize (.> term :getSize)
      :setCursorPos (.> term :setCursorPos)
      :setCursorBlink (.> term :setCursorBlink)
      :blit (.> term :blit)
      :scroll (.> term :scroll) }))
      ;:getPaletteColour (.> term :getPaletteColour)
      ;:setPaletteColour (.> term :setPaletteColour)