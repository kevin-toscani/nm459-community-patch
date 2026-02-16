MACRO UnTriggerScreen arg0
    ;; arg0 = screen to change, usually held in variable screenType
    STX tempx
    STY tempy
    
    lda arg0 ;; this is the value of the screen to change.
        AND #%00000111 ;; look at last bits to know what bit to check, 0-7
        TAX
        LDA ValToBitTable_inverse,x
        STA temp2
    lda arg0 ;; this is the value of the screen to change
    
    LSR
    LSR
    LSR
    ;;; now we have the right *byte* out of the 32 needed for 256 screen bytes
    TAY
    LDA screenTriggers,y ;; now the rigth bit is loaded into the accum
    AND temp2
    BEQ +
        LDA screenTriggers,y ;; now the rigth bit is loaded into the accum
        EOR temp2

ENDM