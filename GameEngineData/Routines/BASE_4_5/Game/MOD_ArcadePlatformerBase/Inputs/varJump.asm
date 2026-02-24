
    LDA Object_v_speed_hi,x
    BPL +skipJump
        LDA #$FF
        STA Object_v_speed_hi,x
    +skipJump:

    RTS

