
;; iNES header
.include SCR_HEADER

;; Constants, macros and variables
.include SCR_SYSTEM_CONSTANTS
.include "GameData\macroList.asm"
.include SCR_MEMORY_MAP

;; Sound handling scripts
.include "Sound\ggsound.inc"

;; Bank assignments
.include SCR_ASSIGN_BANKS

;; Reset routine
.include SCR_RESET

;; Initialization of things
.include SCR_INITIALIZE

;; Main game loop
.include SCR_MAIN_LOOP

;; NMI routine
.include SCR_NMI

;; Tables and subroutines
.include "GameData\ScriptTables.asm"
.include SCR_MATH_FUNCTIONS
.include SCR_LOAD_SUBROUTINES

;; Vectors
.include SCR_VECTORS

