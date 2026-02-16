
MACRO Draw0VariableTiles arg0, arg1, arg2, arg3, arg4, arg5
    ;; arg0 = x
    ;; arg1 = y
    ;; arg2 = full length
    ;; arg3 = empty tile
    ;; arg4 = fill length
    ;; arg5 = fill tile

    LDA arg0
    STA arg0_hold
    STA textBank ;; allows for it to flow over frames.

    LDA arg1
    STA arg1_hold
    LDA arg2
    STA arg2_hold
    LDA arg3
    STA arg3_hold
    LDA arg4
    STA arg4_hold
    LDA arg5
    STA arg5_hold

    LDA hudUpdates
    BNE drawVarTilesHappeningDuringScreenRender
        JSR doDrawVariableTiles
        JMP doneDrawVarTiles

    drawVarTilesHappeningDuringScreenRender:
        JSR doDrawVariableTiles_update

    doneDrawVarTiles:
ENDM

