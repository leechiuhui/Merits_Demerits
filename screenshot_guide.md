# App 截圖拍攝完整指南

## 📱 必需的截圖尺寸

### iPhone 截圖要求
- **6.7 英吋** (iPhone 15 Pro Max): 1290 x 2796 pixels
- **6.1 英吋** (iPhone 15 Pro): 1179 x 2556 pixels  
- **5.5 英吋** (iPhone 8 Plus): 1242 x 2208 pixels

### iPad 截圖要求 (可選，如支援 iPad)
- **12.9 英吋** (iPad Pro): 2048 x 2732 pixels
- **11 英吋** (iPad Pro): 1668 x 2388 pixels

## 🎯 截圖內容建議

### 必拍場景 (建議 4-5 張)
1. **主畫面** - 顯示完整界面（標題、佛學說明、按鈕、計數）
2. **使用中** - 按鈕被按下的瞬間
3. **提醒顯示** - 正念提醒文字出現
4. **統計畫面** - 顯示當日妄念次數
5. **功能說明** - 加上文字說明的版本（可選）

## 📸 截圖拍攝步驟

### 步驟 1: 準備模擬器

#### 創建所需的模擬器
```bash
# iPhone 15 Pro Max (6.7")
xcrun simctl create "iPhone 15 Pro Max Screenshot" "iPhone 15 Pro Max" "iOS 18.5"

# iPhone 15 Pro (6.1") 
xcrun simctl create "iPhone 15 Pro Screenshot" "iPhone 15 Pro" "iOS 18.5"

# iPhone 8 Plus (5.5")
xcrun simctl create "iPhone 8 Plus Screenshot" "iPhone 8 Plus" "iOS 18.5"
```

#### 啟動模擬器
```bash
# 啟動 iPhone 15 Pro Max
xcrun simctl boot "iPhone 15 Pro Max Screenshot"
open -a Simulator

# 安裝 App
xcrun simctl install "iPhone 15 Pro Max Screenshot" "Build/Products/Debug-iphonesimulator/delusionTracker.app"

# 啟動 App
xcrun simctl launch "iPhone 15 Pro Max Screenshot" com.delusion.tracker
```

### 步驟 2: 設定模擬器環境

#### 優化模擬器設定
1. **隱藏狀態列信息**：
   - Simulator → Device → Erase All Content and Settings
   - 重新安裝 App

2. **設定時間顯示**：
   - 系統設定 → 一般 → 日期與時間
   - 設定為 9:41 AM（Apple 官方建議時間）

3. **清理背景**：
   - 關閉所有其他 App
   - 確保 Wi-Fi 信號滿格
   - 充電狀態顯示滿電

### 步驟 3: 拍攝截圖

#### 方法一：使用模擬器內建功能
```bash
# 在模擬器中按 Command + S
# 或從選單：Device → Screenshots → Save Screen
```

#### 方法二：使用命令列
```bash
# 拍攝並儲存截圖
xcrun simctl io "iPhone 15 Pro Max Screenshot" screenshot screenshot_1290x2796_main.png

# 指定路徑
xcrun simctl io "iPhone 15 Pro Max Screenshot" screenshot ~/Desktop/Screenshots/main_screen.png
```

#### 方法三：使用腳本自動拍攝
創建自動截圖腳本：

```bash
#!/bin/bash

# 創建截圖目錄
mkdir -p Screenshots/{iPhone_6.7,iPhone_6.1,iPhone_5.5}

# iPhone 15 Pro Max (6.7")
echo "📱 拍攝 iPhone 15 Pro Max 截圖..."
xcrun simctl boot "iPhone 15 Pro Max Screenshot"
sleep 3
xcrun simctl install "iPhone 15 Pro Max Screenshot" "Build/Products/Debug-iphonesimulator/delusionTracker.app"
xcrun simctl launch "iPhone 15 Pro Max Screenshot" com.delusion.tracker
sleep 2

# 拍攝主畫面
xcrun simctl io "iPhone 15 Pro Max Screenshot" screenshot "Screenshots/iPhone_6.7/01_main_screen.png"
echo "等待 5 秒，請準備下一個場景..."
sleep 5

# 可以在這裡添加模擬用戶操作
echo "請按下 App 中的按鈕，然後按 Enter..."
read

# 拍攝使用中畫面
xcrun simctl io "iPhone 15 Pro Max Screenshot" screenshot "Screenshots/iPhone_6.7/02_button_pressed.png"
sleep 3

# 拍攝提醒顯示
xcrun simctl io "iPhone 15 Pro Max Screenshot" screenshot "Screenshots/iPhone_6.7/03_reminder_shown.png"

echo "✅ iPhone 15 Pro Max 截圖完成！"
```

### 步驟 4: 截圖場景設計

#### 場景 1: 主畫面
**目標**: 展示完整的 App 界面
- 顯示「妄念追蹤器」標題
- 顯示佛學說明文字
- 顯示「今日妄念: 0」計數
- 顯示狗狗按鈕
- 顯示操作提示文字

#### 場景 2: 使用中
**目標**: 展示 App 的核心功能
- 按鈕被按下的視覺效果
- 計數增加（今日妄念: 1）
- 可能顯示震動效果（視覺提示）

#### 場景 3: 提醒顯示
**目標**: 展示正念提醒功能
- 顯示隨機正念提醒文字
- 如「妄念現形！🧘」或「回到當下！✨」
- 橙色文字醒目顯示

#### 場景 4: 統計畫面
**目標**: 展示追蹤功能
- 顯示較高的計數數字（如：今日妄念: 8）
- 展示 App 的實用性

#### 場景 5: 功能說明（可選）
**目標**: 添加說明文字版本
- 使用圖片編輯軟體添加文字說明
- 突出主要功能特色

## 🎨 截圖美化建議

### 基本要求
1. **高品質**: 確保截圖清晰、無模糊
2. **真實性**: 必須是實際 App 運行截圖
3. **一致性**: 所有截圖風格保持一致
4. **吸引力**: 突出 App 的核心價值

### 可選美化
1. **背景**: 保持 App 原生背景，不添加裝飾
2. **文字說明**: 可在截圖上添加簡短功能說明
3. **框架**: 可添加設備框架（但 App Store 會自動添加）

## 📁 檔案命名規範

### 建議命名格式
```
iPhone_6.7_01_main_screen.png
iPhone_6.7_02_button_pressed.png
iPhone_6.7_03_reminder_shown.png
iPhone_6.7_04_statistics.png
iPhone_6.7_05_with_description.png

iPhone_6.1_01_main_screen.png
iPhone_6.1_02_button_pressed.png
...

iPhone_5.5_01_main_screen.png
iPhone_5.5_02_button_pressed.png
...
```

## ⚡ 快速拍攝腳本

創建一鍵拍攝腳本：

```bash
#!/bin/bash

echo "📸 開始 App 截圖拍攝流程..."

# 檢查是否有編譯好的 App
if [ ! -d "Build/Products/Debug-iphonesimulator/delusionTracker.app" ]; then
    echo "🔨 先編譯 App..."
    ./build.sh
fi

# 創建截圖目錄
mkdir -p Screenshots/iPhone_{6.7,6.1,5.5}

# 定義設備
devices=("iPhone 15 Pro Max:iPhone_6.7" "iPhone 15 Pro:iPhone_6.1" "iPhone 8 Plus:iPhone_5.5")

for device_info in "${devices[@]}"; do
    device_name=$(echo $device_info | cut -d: -f1)
    folder_name=$(echo $device_info | cut -d: -f2)
    
    echo "📱 拍攝 $device_name 截圖..."
    
    # 創建模擬器名稱
    sim_name="${device_name} Screenshot"
    
    # 啟動模擬器
    xcrun simctl boot "$sim_name" 2>/dev/null || {
        echo "創建模擬器: $sim_name"
        xcrun simctl create "$sim_name" "$device_name" "iOS 18.5"
        xcrun simctl boot "$sim_name"
    }
    
    # 等待啟動
    sleep 3
    
    # 安裝並啟動 App
    xcrun simctl install "$sim_name" "Build/Products/Debug-iphonesimulator/delusionTracker.app"
    xcrun simctl launch "$sim_name" com.delusion.tracker
    sleep 2
    
    # 拍攝主畫面
    xcrun simctl io "$sim_name" screenshot "Screenshots/$folder_name/01_main_screen.png"
    
    echo "✅ $device_name 主畫面截圖完成"
    echo "💡 現在請："
    echo "   1. 在模擬器中操作 App"
    echo "   2. 手動拍攝其他場景 (⌘+S)"
    echo "   3. 截圖會保存到桌面"
    echo ""
done

echo "🎉 基本截圖拍攝完成！"
echo "📁 截圖位置: Screenshots/ 目錄"
echo ""
echo "📝 後續步驟："
echo "1. 手動拍攝使用場景（按按鈕、顯示提醒等）"
echo "2. 檢查截圖品質和內容"
echo "3. 重新命名和整理檔案"
echo "4. 上傳到 App Store Connect"
```

## 🔍 品質檢查清單

### 技術檢查
- [ ] 解析度符合要求
- [ ] 檔案格式為 PNG 或 JPEG
- [ ] 檔案大小 < 30MB
- [ ] 截圖清晰無模糊

### 內容檢查
- [ ] 顯示實際 App 功能
- [ ] 無測試數據或 placeholder
- [ ] 文字可讀性良好
- [ ] 界面完整無遮擋

### App Store 政策
- [ ] 無誤導性內容
- [ ] 無不當文字或圖像
- [ ] 符合年齡分級要求
- [ ] 突出核心功能價值

## 📤 上傳到 App Store Connect

### 上傳步驟
1. 登入 [App Store Connect](https://appstoreconnect.apple.com/)
2. 進入您的 App 頁面
3. 點擊「App Store」標籤
4. 在對應設備尺寸區域點擊「+」
5. 上傳相應尺寸的截圖
6. 調整截圖順序
7. 儲存變更

### 重要提醒
- 第一張截圖最重要，會在搜索結果中顯示
- 最多可上傳 10 張截圖
- 建議上傳 4-5 張最能展示功能的截圖
- 可為不同語言設定不同截圖

---

**💡 小提示：良好的截圖是提高下載率的關鍵因素！** 