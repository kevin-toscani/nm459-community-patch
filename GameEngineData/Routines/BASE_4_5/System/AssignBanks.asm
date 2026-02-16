
;; Bank $00
.base $8000
.include SCR_BANK00
.pad $C000

;; Bank $01
.base $8000
.include SCR_BANK01
.pad $C000

;; Bank $02
.base $8000
.include SCR_BANK02
.pad $C000


;; Bank $03
.base $8000
.include SCR_BANK03
.pad $C000

;; Bank $04
.base $8000
.include SCR_BANK04
.pad $C000

;; Bank $05
.base $8000
.include SCR_BANK05
.pad $C000

;; Bank $06
.base $8000
.include SCR_BANK06
.pad $C000

;; Bank $07
.base $8000
.include SCR_BANK07
.pad $C000

;; Bank $08
.base $8000
.include SCR_BANK08
.pad $C000

;; Bank $09
.base $8000
.include SCR_BANK09
.pad $C000

;; Bank $0A (10)
.base $8000
.include SCR_BANK0A
.pad $C000

;; Bank $0B (11)
.base $8000
.include SCR_BANK0B
.pad $C000

;; Bank $0C (12)
.base $8000
.include SCR_BANK0C
.pad $C000

;; Bank $0D (13)
.base $8000
.include SCR_BANK0D
.pad $C000

;; Bank $0E (14)
.base $8000
.include SCR_BANK0E
.pad $C000

;; Bank $0F (15)
.base $8000
.include SCR_BANK0F
.pad $C000

;; Bank $10 (16)
.base $8000
.include SCR_BANK10
.pad $C000

;; Bank $11 (17)
.base $8000
.include SCR_BANK11
.pad $C000

;; Bank $12 (18)
.base $8000
.include SCR_BANK12
.pad $C000

;; Bank $13 (19)
.base $8000
.include SCR_BANK13
.pad $C000

;; Bank $14 (20)
.base $8000
.include SCR_BANK14
.pad $C000

;; Bank $15 (21)
.base $8000
.include SCR_BANK15
.pad $C000

;; Bank $16 (22)
.base $8000
.include SCR_BANK16
.pad $C000

;; Bank $17 (23)
.base $8000
.include SCR_BANK17
.pad $C000

;; Bank $18 (24)
.base $8000
.include SCR_BANK18
.pad $C000

;; Bank $19 (25)
.base $8000
.include SCR_BANK19
.pad $C000

;; Bank $1A (26)
.base $8000
.include SCR_BANK1A
.pad $C000

;; Bank $1B (27)
.base $8000
.include SCR_BANK1B
.pad $C000

;; Bank $1C (28)
.base $8000
.include SCR_BANK1C
.pad $C000

;; Bank $1D (29)
.base $8000
.include SCR_BANK1D
.pad $C000

;; Bank $1E (30)
.base $8000
.include SCR_BANK1E
.pad $C000


;; Bank $1F (31, static bank)

.org $C000
;; Because $C000 is the last 16kb of memory.
;; The first 16 starts at 8000, so the swappable banks will go from
;; $8000-BFFF.
;; Everything here will be in the static bank.
;; Everything moved into 8000 will be in the swappable 16k bank.

