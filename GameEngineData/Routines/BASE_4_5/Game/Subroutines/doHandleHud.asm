
    ;; handle hud

    SwitchBank #$18
        JSR doDrawHud_bank18
    ReturnBank

    LDA gameHandler
    AND #%00100000
    BEQ +doDrawHudUpdates
        RTS
    +doDrawHudUpdates:

.include GameData\HUD_INCLUDES.dat

