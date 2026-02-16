;;;; 
    
    TXA
    STA temp ;; assumes the object we want to move is in x.

        StartMoving temp, #DOWNRIGHT
      ;  TXA
       ; STA temp ;; assumes the object we want to move is in x.
       ; ChangeFacingDirection temp, #FACE_DOWN

    RTS