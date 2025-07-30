# 2024 IC Design Contest
# Cell-Based IC Design Category for Graduate Level
# Huge Matrix Calculations
## 1. Problem
 - 請完成 Huge Matrix Calculations (**後文以 HMC 表示**)的電路設計。HMC 電路功能如圖一所示, 從 ROM Data 載入 128x128 的 Matrix A 及 Matrix B 後,將矩陣作相乘運算得到 128x128 的 Matrix C 依序存入至電路內部的 SRAM 後, 將本電路的輸出腳位 done 拉為 High, 即完成整個電路動作。
 - 有關 HMC 電路運作的細項說明將描述於 2.3 節。
 - 本次 IC 設計競賽比賽時間為上午 08:30 到下午 20:30。當 IC 設計競賽結束後，會根據第三節中的評分標準進行評分。為了評分作業的方便，各參賽隊伍應參考附錄 E 中所列的要求，附上評分所需要的檔案。本題 `icc2024cb.tar` 之解壓縮方式如下：`tar xvf /usr/cad/icc2024/bgc/icc2024cb.tar`

## 2. Modules
### 2.1 Block Diagram
### 2.2 In/Out