# App Store 提交完整指南

## 📋 上架前檢查清單

### ✅ 技術準備
- [ ] Apple Developer Program 帳號 ($99/年)
- [ ] iOS Distribution Certificate
- [ ] App Store Provisioning Profile  
- [ ] Bundle ID 設定正確
- [ ] App 圖示 (1024x1024)
- [ ] 各尺寸設備圖示
- [ ] App 截圖 (各種尺寸)
- [ ] App 預覽影片 (可選)

### ✅ 內容準備
- [ ] App 名稱和副標題
- [ ] App 描述 (完整版和簡短版)
- [ ] 關鍵字
- [ ] 分類設定
- [ ] 年齡分級
- [ ] 隱私政策 (如需要)
- [ ] 支援聯絡資訊

## 🎯 詳細步驟

### 步驟 1: 創建 App Store Connect 記錄

1. **登入 App Store Connect**
   ```
   網址: https://appstoreconnect.apple.com/
   使用您的 Apple Developer 帳號登入
   ```

2. **創建新 App**
   - 點擊「我的 App」
   - 點擊「+」按鈕
   - 選擇「新增 App」
   - 填寫基本資訊：
     - 名稱: `妄念追蹤器`
     - 語言: `繁體中文`
     - Bundle ID: `com.mindfulness.tracker`
     - SKU: `mindfulness-tracker-001`

### 步驟 2: 設定 App 資訊

#### 🖼️ App 資訊頁面
1. **名稱和描述**
   - App 名稱: `妄念追蹤器 - 正念覺察助手`
   - 副標題: `專注當下，覺察妄念，培養正念習慣`
   - 推廣文字: `「旺」一聲提醒，回歸當下！結合佛學智慧的正念覺察工具`

2. **關鍵字**
   ```
   正念,冥想,覺察,妄念,禪修,佛學,心理健康,壓力管理,專注力,當下
   ```

3. **分類**
   - 主要分類: `健康健美`
   - 次要分類: `生活風格`

#### 📱 定價和供應狀況
1. **定價**
   - 選擇「免費」
   - 或設定價格層級

2. **供應地區**
   - 建議選擇「所有地區」
   - 或特定地區（台灣、香港、中國大陸等）

#### 🎨 App Store 顯示
1. **上傳 App 圖示**
   - 1024 x 1024 像素
   - PNG 格式
   - 無透明度
   - 無圓角（系統會自動添加）

2. **上傳截圖**
   各種設備尺寸的截圖：
   - iPhone 6.7" (必需)
   - iPhone 6.1" (必需)  
   - iPhone 5.5" (必需)
   - iPad Pro 12.9" (如支援 iPad)
   - iPad Pro 11" (如支援 iPad)

3. **App 預覽影片** (可選)
   - 長度: 15-30 秒
   - 格式: .mov, .mp4, .m4v
   - 解析度: 與對應設備截圖相同

### 步驟 3: 版本資訊

#### 📝 版本詳細資訊
1. **版本號碼**: `1.0`
2. **版本說明**:
   ```
   🎉 妄念追蹤器首次發布！

   ✨ 主要功能：
   • 一鍵記錄妄念覺察
   • 狗狗「旺」聲提醒
   • 正念智慧文字
   • 每日統計追蹤
   • 震動觸覺回饋

   🧘 開始您的正念之旅，在每個當下覺察妄念！
   ```

#### 🛡️ App 審查資訊
1. **聯絡資訊**
   - 姓名: `您的姓名`
   - 電話: `您的電話號碼`
   - 電子郵件: `您的電子郵件`

2. **備註** (給審查團隊):
   ```
   妄念追蹤器是一個正念覺察工具 App，幫助用戶培養覺察力。
   
   主要功能：
   1. 點擊按鈕記錄妄念出現次數
   2. 播放提醒音效
   3. 顯示正念提醒文字
   4. 本地數據統計
   
   App 完全離線運行，不收集任何個人資料。
   所有內容均為正面教育性質，參考佛學正念修習概念。
   ```

#### 📊 內容權限
1. **年齡分級**: `4+`
2. **內容描述**:
   - 無不當內容
   - 教育/參考內容
   - 正向心理健康內容

### 步驟 4: 構建上傳

#### 🔨 準備 Release 版本
1. **在 Xcode 中**:
   ```
   Product → Archive
   選擇 iOS Device 目標
   確保 Release 配置
   ```

2. **使用腳本**:
   ```bash
   ./prepare_appstore.sh
   ```

3. **手動上傳**:
   ```bash
   # 使用 Xcode
   Window → Organizer → Archives → Upload to App Store
   
   # 或使用 Transporter App
   從 Mac App Store 下載 Transporter
   登入並上傳 .ipa 檔案
   ```

### 步驟 5: 提交審查

#### 📤 最終提交
1. **檢查所有資訊**
   - App 資訊完整
   - 截圖正確
   - 描述準確
   - 構建版本已上傳

2. **提交審查**
   - 點擊「提交以供審查」
   - 確認所有問題和回答
   - 等待審查結果

#### ⏱️ 審查時程
- **一般審查時間**: 24-48 小時
- **首次提交**: 可能需要 2-7 天
- **被拒絕後重新提交**: 通常較快

## 🚨 常見審查問題和解決方案

### ❌ 可能的拒絕原因

1. **元數據問題**
   - 描述與功能不符
   - 截圖不準確
   - 關鍵字違規

2. **技術問題**
   - App 崩潰或 bug
   - 載入時間過長
   - 功能不完整

3. **內容問題**
   - 宗教內容敏感性
   - 誤導性聲稱
   - 版權問題

### ✅ 預防措施

1. **對於佛學內容**:
   ```
   在審查備註中說明：
   - 這是教育性正念工具
   - 不是宗教傳播 App
   - 基於科學研究的正念練習
   - 無宗教儀式或信仰要求
   ```

2. **功能說明要清楚**:
   ```
   - 明確說明 App 功能
   - 避免誇大健康效果
   - 強調這是工具而非治療
   ```

3. **截圖要準確**:
   ```
   - 顯示實際 App 介面
   - 不要添加誤導性文字
   - 確保與實際功能一致
   ```

## 📈 上架後優化

### 🔍 ASO (App Store Optimization)

1. **關鍵字優化**
   - 定期檢查關鍵字排名
   - 根據用戶搜索調整關鍵字
   - 監控競爭對手關鍵字

2. **用戶評價管理**
   - 回覆用戶評論
   - 修復用戶反饋的問題
   - 鼓勵滿意用戶留下評價

3. **定期更新**
   - 修復 bug
   - 添加新功能
   - 優化用戶體驗

### 📊 數據追蹤

1. **App Store Connect Analytics**
   - 下載量追蹤
   - 用戶留存率
   - 崩潰報告分析

2. **用戶反饋收集**
   - App 內反饋機制
   - 電子郵件支援
   - 社交媒體監控

## 📞 支援資源

### 🔗 官方資源
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

### 📚 學習資源
- [WWDC App Store 相關 Session](https://developer.apple.com/videos/)
- [App Store Optimization 指南](https://developer.apple.com/app-store/app-store-optimization/)
- [測試和品質保證](https://developer.apple.com/testing/)

### 💬 社群支援
- [Apple Developer Forums](https://developer.apple.com/forums/)
- [Stack Overflow - iOS](https://stackoverflow.com/questions/tagged/ios)
- [Reddit - iOS Programming](https://www.reddit.com/r/iOSProgramming/)

---

**🎯 記住：成功上架的關鍵是準備充分、內容真實、功能完整！** 