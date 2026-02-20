
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;============= TIMER UPDATES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    DEC Object_action_timer,x
    LDA Object_action_timer,x
    BNE doneActionTimer
        ;; action timer has reached zero.
        ;; read end action.
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;; FIRST, get the frame number.
        
            SwitchBank #$1C
                LDY Object_type,x
                LDA EndActionAnimationTableLo,y
                STA pointer
                LDA EndActionAnimationTableHi,y
                STA pointer+1
                LDA Object_frame,x
                LSR
                LSR
                LSR
                AND #%00000111
                TAY        
                LDA (pointer),y
                AND #%00001111
                STA tempD
            
            LDA tempD
            TAY
            
            LDA EndAnimAndActions_Lo,y
            STA temp16
            LDA EndAnimAndActions_Hi,y
            STA temp16+1
            JSR doTemp16
                 

                 
            ReturnBank     
        
doneActionTimer: