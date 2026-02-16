;;;Optimized doGetRandomNumber by TakuikaNinja
;;; https://www.nesmakers.com/index.php?threads/improving-dogetrandomnumber.7927/
doGetRandomNumber:
    LDA randomSeed1
    ASL
    BCS +
    EOR #$9e
+
    ADC #$81
    STA randomSeed1
    RTS