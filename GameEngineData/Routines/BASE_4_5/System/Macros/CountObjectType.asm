
MACRO CountObjectType arg0
    ;; arg0 - what object type (number) are we talking about (what objects are we counting?)

    LDA arg0
    STA tempA

    TXA
    PHA
    TYA
    PHA

    LDA #$00
    STA temp

    LDX #$00
    -countObjectLoop:
        LDA Object_status,x
        AND #%10000000
        BEQ +skipCountingThisObject
            LDA Object_type,x
            CMP tempA
            BNE +skipCountingThisObject
                INC temp
        +skipCountingThisObject

        INX
        CPX #TOTAL_MAX_OBJECTS
    BNE -countObjectLoop

    PLA
    TAY
    PLA
    TAX

    LDA temp ;; now the accumulator holds the number of that type of object still activated.
ENDM

