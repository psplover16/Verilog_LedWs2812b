# Verilog_LedWs2812b
LedWs2812b 應用，雛型已經完成

數據傳輸時間，(TH+TL = 1.25us ± 600ns)

|  符號   | 符號解釋  | 延遲秒數(us) | 誤差秒數(ns)
|  ----  | ----  |
| T0H | 0碼，高電壓時間 | 0.4 |  ± 150
| T1H | 1碼，高電壓時間 | 0.85 |  ± 150
| T0L | 0碼，低電壓時間 | 0.85 |   ± 150
| T1L | 1碼，低電壓時間 | 0.4  |  ± 150
| RES | 0碼，低電壓時間 | 50以上 | ~

ws2812b採用 GRB 的順序發送，以單一顏色，00000000~11111111的方式發送單一顏色，共三組

若要發送1，則需要採用T1H+T1L的方式發送(高電壓先發)
連續輸出50ns低電壓，表示發送資料結束
