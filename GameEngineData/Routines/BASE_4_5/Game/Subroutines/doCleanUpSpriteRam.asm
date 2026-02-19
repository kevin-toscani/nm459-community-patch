
doCleanUpSpriteRam:
    ;; Clean up sprite ram
    LDY spriteRamPointer

    -clearSpriteRamLoop:
        LDA #$FE
        STA SpriteRam,y
        INY
        INY
        INY
        INY
    BNE -clearSpriteRamLoop

    RTS

