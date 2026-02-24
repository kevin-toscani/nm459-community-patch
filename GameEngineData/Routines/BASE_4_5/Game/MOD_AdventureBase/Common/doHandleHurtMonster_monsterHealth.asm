
    STX temp

    ;; Check if object is not hurting yet.
    GetActionStep temp
    CMP #$07 ;; we will use action step 7 for hurt.
    BEQ +doSkipHurtingThisObject ;; if he is hurt, he can't be hurt again.

        ;; Put object in hurt state
        ChangeActionStep temp, #$07

        ;; Take health point
        DEC Object_health,x

        ;; If no health left, destroy object
        BNE +doSkipHurtingThisObject
        DestroyObject
    +doSkipHurtingThisObject

