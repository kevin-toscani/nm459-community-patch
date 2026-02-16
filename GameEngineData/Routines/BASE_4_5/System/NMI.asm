
NMI:

    ;; Push whatever is in the accumulator to the stack
    PHA

    ;; Check if we're in NMI already; if so, skip
    LDA doNMI
    BEQ +
        JMP +skipWholeNMI
    +

    ;; Tell game that we're in NMI
    INC doNMI

    ;; Push registers to stack
    TXA
    PHA
    TYA
    PHA
    PHP
    
    ;; Push RAM values to stack
    ;; @TODO cleanup which values need pushing and which don't
    LDA temp
    PHA 
    LDA temp1
    PHA 
    LDA temp2
    PHA 
    LDA temp3
    PHA 
    LDA tempx
    PHA 
    LDA tempy
    PHA 
    LDA tempz
    PHA 
    
    LDA tempA
    PHA
    LDA tempB
    PHA
    LDA tempC
    PHA
    LDA tempD
    PHA

    LDA arg0_hold
    PHA
    LDA arg1_hold
    PHA
    LDA arg2_hold
    PHA
    LDA arg3_hold
    PHA
    LDA arg4_hold
    PHA
    LDA arg5_hold
    PHA
    LDA arg6_hold
    PHA
    LDA arg7_hold
    PHA
    
    LDA temp16
    PHA 
    LDA temp16+1
    PHA 
    
    LDA pointer
    PHA
    LDA pointer+1
    PHA
    
    LDA pointer2
    PHA
    LDA pointer2+1
    PHA
    
    LDA pointer3
    PHA
    LDA pointer3+1
    PHA
    
    LDA pointer6
    PHA
    LDA pointer6+1
    PHA
    
    LDA currentBank
    PHA 
    LDA prevBank
    PHA 
    LDA tempBank
    PHA 
    LDA chrRamBank
    PHA

    ;; Check if PPU updates must be skipped or not
    LDA skipNMI
    BEQ +
        JMP +updateNmiCounters
    +

    LDA #$00
    STA $2000
    LDA soft2001
    STA $2001
    
    ;; Set OAM DMA (update sprites on screen)
    LDA #$00
    STA $2003
    LDA #$02
    STA $4014

    ;; Check if screen is on; if not, skip PPU updates
    LDA soft2001
    BNE +
        JMP +updateViewportScreen
    +

    ;; Reset PPU high/low latch
    BIT $2002


;checkBackgroundPaletteUpdates:
    ;; Check for background palette updates
    LDA updateScreenData
    AND #%00000001
    BNE +
        JMP +checkSpritePaletteUpdates
    +
    .include SCR_LOAD_PALETTES
    JMP +updateViewportScreen


+checkSpritePaletteUpdates:
    ;; Check for sprite palette updates
    LDA updateScreenData
    AND #%00000010
    BNE +
        JMP +checkPpuUpdates
    +
    .include SCR_LOAD_SPRITE_PALETTES
    JMP +updateViewportScreen


+checkPpuUpdates:
    ;; Check for other PPU updates
    LDA updateScreenData
    AND #%00000100
    BNE +
        JMP +updateViewportScreen
    +
    .include SCR_UPDATE_SCROLL_COLUMN


+updateViewportScreen:
    ;; Update current screen number in viewport
    LDA camY_hi
    ASL
    ASL
    ASL
    ASL
    CLC
    ADC camX_hi
    STA camScreen

    ;; Update nametable in PPUCTRL
    AND #%00000001
    ORA #%10010000
    STA $2000
    
    ;; Update camera offset
    ;; (only if screen is turned on)
    LDA soft2001
    BEQ +ignorePpuScroll
        LDA camX
        STA $2005
        LDA camY
        STA $2005
    +ignorePpuScroll:


+updateNmiCounters:
    INC vBlankTimer
    INC randomSeed

    ;; music player things
    SwitchBank #$1B
        JSR doSoundEngineUpdate 
    ReturnBank

    ;; Pull RAM values from stack
    PLA
    STA chrRamBank
    PLA 
    STA tempBank
    PLA 
    STA prevBank
    PLA
    STA currentBank
    
    PLA
    STA pointer6+1
    PLA
    STA pointer6
    PLA
    STA pointer3+1
    PLA
    STA pointer3
    
    PLA
    STA pointer2+1
    PLA
    STA pointer2
    
    PLA
    STA pointer+1
    PLA
    STA pointer
    
    PLA
    STA temp16+1
    PLA
    STA temp16

    PLA
    STA arg7_hold
    PLA
    STA arg6_hold
    PLA
    STA arg5_hold
    PLA
    STA arg4_hold
    PLA
    STA arg3_hold
    PLA
    STA arg2_hold
    PLA
    STA arg1_hold
    PLA
    STA arg0_hold
    
    PLA 
    STA tempD
    PLA
    STA tempC
    PLA
    STA tempB
    PLA 
    STA tempA
    
    PLA 
    STA tempz
    PLA 
    STA tempy
    PLA
    STA tempx
    PLA 
    STA temp3
    PLA 
    STA temp2
    PLA 
    STA temp1
    PLA 
    STA temp
    
    ;; Tell game that NMI is done
    DEC doNMI
    
    ;; Pull registers from stack
    PLP
    PLA
    TAY
    PLA
    TAX


+skipWholeNMI:
    ;; Tell game to stop waiting
    LDA #$00
    STA waiting

    ;; Pull accumulator from stack
    PLA

    ;; Return from interrupt
    RTI

