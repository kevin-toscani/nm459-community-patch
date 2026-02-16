
    LDX player1_object
    LDA Object_v_speed_lo,x
    CLC
    ADC #$00
    LDA Object_v_speed_hi,x
    ADC #$00
    BPL +skipJump
        LDA Object_v_speed_hi,x
        CMP #$01
        BCC +skipJump

        LDA #$00
        SEC 
        SBC #$01
        STA Object_v_speed_hi,x
    +skipJump:

    RTS

