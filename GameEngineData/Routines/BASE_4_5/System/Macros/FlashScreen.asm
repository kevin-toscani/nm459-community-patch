MACRO FlashScreen arg0, arg1
;arg0 = fast or slow flash? (0 for fast or 1 for slow)
;arg1 = what color of flashes? (#$30 is white)

LDA arg0
STA arg0_hold
LDA arg1
STA arg1_hold

flashScreen:
LDA bckPal+0
STA tempA
LDA bckPal+1
STA tempB
LDA bckPal+2
STA tempC
LDA bckPal+3
STA tempD

JSR doWaitFrame
JSR doWaitFrame
JSR doWaitFrame

LDA arg1_hold
STA bckPal+0
LDA arg1_hold
STA bckPal+1
LDA arg1_hold
STA bckPal+2
LDA arg1_hold
STA bckPal+3

LDA #$01
STA updateScreenData

JSR doWaitFrame

LDA tempA
STA bckPal+0
LDA tempB
STA bckPal+1
LDA tempC
STA bckPal+2
LDA tempD
STA bckPal+3

LDA #$01
STA updateScreenData

JSR doWaitFrame
JSR doWaitFrame
JSR doWaitFrame

DEC arg0_hold

LDA arg0_hold
BEQ flashScreen

ENDM