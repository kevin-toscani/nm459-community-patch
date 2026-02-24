
    ;; This will cycle between a list of 8 possible selectable objects. It will
    ;; increase it and then force it to a value between 0-7, looping when it
    ;; gets to 8.

    INC weaponChoice
    LDA weaponChoice
    AND #%00000111
    STA weaponChoice
    RTS

