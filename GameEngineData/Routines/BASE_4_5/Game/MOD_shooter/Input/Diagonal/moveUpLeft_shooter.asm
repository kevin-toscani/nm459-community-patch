;;;; 
    
    STX temp ;; assumes the object we want to move is in x.

        StartMoving temp, #UPLEFT
      ;  TXA
       ; STA temp ;; assumes the object we want to move is in x.
       ; ChangeFacingDirection temp, #FACE_DOWN

    RTS