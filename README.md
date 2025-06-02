# 妄念追蹤器 (Mindfulness Tracker)

「一切念頭，皆緣起性空，無有自性，虛妄和合而起，故名妄念。當妄（旺）念升起之時，讓一聲可愛狗狗『旺！』提醒您——此念非真，莫逐妄流，當下覺照，回歸本心。」

一個簡單而有效的 iOS App，幫助您覺察和記錄每分每秒的妄念，培養正念習慣。

## 📱 功能特色

### 核心功能
- **一鍵記錄妄念** ✅ - 當腦中有妄念浮現時，輕觸紅色按鈕
- **聲音提醒** 🐶 - 每次按下按鈕會發出「旺旺！」提醒聲
- **正念文字提醒** 🧘 - 隨機顯示覺察提醒語（如「妄念現形！」或「回到當下！」）
- **每日計數統計** 📊 - 自動追蹤每日妄念次數
- **觸覺回饋** 📳 - 按鈕按下時的震動回饋

### 設計理念
參考 [Panic Tracker: The Red Button](https://apps.apple.com/tw/app/panic-tracker-the-red-button/id6743371838?l=en-GB) 的簡潔設計，專注於：
- 極簡介面，零學習成本
- 即時回饋，強化覺察行為
- 日常化使用，培養正念習慣

## 🎯 使用方法

1. **打開 App** - 看到大紅按鈕和當日計數
2. **覺察妄念** - 當注意到腦中有妄念、雜念時
3. **按下按鈕** - 輕觸紅色 ✅ 按鈕
4. **接收提醒** - 聽到聲音、看到提醒文字、感受震動
5. **回歸當下** - 讓覺察幫助您重新專注

## 🛠️ 技術特色

### 開發環境
- **語言**: Swift 5.0
- **框架**: UIKit
- **平台**: iOS 17.5+
- **開發工具**: Xcode

### 主要技術實現
- 使用 UIKit 構建原生介面
- AVFoundation 處理音效播放
- UserDefaults 實現本地數據持久化
- Core Animation 提供流暢的視覺效果
- Core Haptics 提供觸覺反饋

### 隱私保護
- **完全離線** - 所有數據存儲在本地設備
- **無網路連接** - 不收集任何個人資料
- **數據安全** - 妄念記錄僅供個人使用

## 📝 提醒文字集合

App 會隨機顯示以下正念提醒：
- "妄念現形！🧘"
- "回到當下！✨"
- "覺察妄念，回歸真實 🌟"
- "念頭來了又走，保持覺知 🌸"
- "活在當下，不被妄念帶走 🦋"

## 🏗️ 專案結構

```
MindfulnessTracker/
├── MindfulnessTracker.xcodeproj     # Xcode 專案檔
├── MindfulnessTracker/              # 主要程式碼目錄
│   ├── AppDelegate.swift            # App 生命週期管理
│   ├── SceneDelegate.swift          # 場景管理
│   ├── ContentView.swift            # 主介面控制器
│   ├── Assets.xcassets/             # 圖片資源
│   ├── Base.lproj/
│   │   └── LaunchScreen.storyboard  # 啟動畫面
│   ├── Info.plist                   # App 配置資訊
│   └── woof.wav                     # 狗叫聲音效檔（可選）
└── README.md                        # 說明文件
```

## 🚀 安裝與運行

### 環境需求
- macOS 13.5 或更高版本
- Xcode 15.0 或更高版本
- iOS 17.5 或更高版本的目標設備

### 🔨 編譯方法

#### 方法一：使用命令列 (推薦)

1. **進入專案目錄**
```bash
cd /路徑/到/MindfulnessTracker專案
```

2. **清理並重新編譯**
```bash
xcodebuild -project MindfulnessTracker.xcodeproj \
  -scheme MindfulnessTracker \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro Test,OS=18.5' \
  clean build
```

3. **安裝到模擬器**
```bash
# 找到編譯後的 App 路徑
APP_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "MindfulnessTracker.app" -path "*/Debug-iphonesimulator/*" | head -1)

# 安裝 App
xcrun simctl install 'iPhone 15 Pro Test' "$APP_PATH"
```

4. **啟動 App**
```bash
xcrun simctl launch 'iPhone 15 Pro Test' com.mindfulness.tracker
```

#### 方法二：使用 Xcode GUI

1. **打開專案**
   - 雙擊 `MindfulnessTracker.xcodeproj` 檔案

2. **清理專案**
   - 選單 → Product → Clean Build Folder (⇧⌘K)

3. **重新編譯**
   - 選單 → Product → Build (⌘B)

4. **運行 App**
   - 選單 → Product → Run (⌘R)
   - 或直接按下播放按鈕 ▶️

#### 快速一鍵編譯腳本

創建一個 `build.sh` 檔案：

```bash
#!/bin/bash

# 妄念追蹤器 - 一鍵編譯腳本
# MindfulnessTracker - One-Click Build Script

echo "🔨 開始編譯 MindfulnessTracker..."
echo "🔨 Starting to build MindfulnessTracker..."

# 檢查是否在正確的目錄
if [ ! -f "MindfulnessTracker.xcodeproj/project.pbxproj" ]; then
    echo "❌ 錯誤：請在 MindfulnessTracker 專案根目錄中執行此腳本"
    echo "❌ Error: Please run this script in the MindfulnessTracker project root directory"
    exit 1
fi

# 清理並編譯
echo "🧹 清理舊的建置檔案..."
echo "🧹 Cleaning old build files..."

xcodebuild -project MindfulnessTracker.xcodeproj \
  -scheme MindfulnessTracker \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro Test,OS=18.5' \
  clean build

# 檢查編譯結果
if [ $? -eq 0 ]; then
    echo "✅ 編譯成功！"
    echo "✅ Build successful!"
    
    # 找到 App 路徑
    echo "🔍 尋找編譯後的 App..."
    echo "🔍 Looking for compiled app..."
    
    APP_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "MindfulnessTracker.app" -path "*/Debug-iphonesimulator/*" | head -1)
    
    if [ -n "$APP_PATH" ]; then
        echo "📱 安裝 App 到模擬器..."
        echo "📱 Installing app to simulator..."
        
        xcrun simctl install 'iPhone 15 Pro Test' "$APP_PATH"
        
        if [ $? -eq 0 ]; then
            echo "🚀 啟動 App..."
            echo "🚀 Launching app..."
            
            xcrun simctl launch 'iPhone 15 Pro Test' com.mindfulness.tracker
            
            if [ $? -eq 0 ]; then
                echo ""
                echo "🎉 完成！App 已在模擬器中運行"
                echo "🎉 Done! App is now running in simulator"
                echo ""
                echo "📱 妄念追蹤器已準備就緒，開始您的正念練習！"
                echo "📱 MindfulnessTracker is ready, start your mindfulness practice!"
            else
                echo "❌ 啟動 App 失敗"
                echo "❌ Failed to launch app"
            fi
        else
            echo "❌ 安裝 App 失敗"
            echo "❌ Failed to install app"
        fi
    else
        echo "❌ 找不到編譯後的 App 檔案"
        echo "❌ Could not find compiled app file"
        echo "💡 提示：檢查 DerivedData 目錄或重新編譯"
        echo "💡 Hint: Check DerivedData directory or rebuild"
    fi
else
    echo "❌ 編譯失敗"
    echo "❌ Build failed"
    echo ""
    echo "🔧 常見解決方法："
    echo "🔧 Common solutions:"
    echo "1. 清理 DerivedData: rm -rf ~/Library/Developer/Xcode/DerivedData"
    echo "2. 確保 Xcode 已安裝: xcode-select --install"
    echo "3. 檢查模擬器是否存在: xcrun simctl list devices"
    exit 1
fi
```

**使用方法：**

1. **創建腳本檔案**
   ```bash
   # 複製上述內容到 build.sh 檔案
   nano build.sh
   # 或使用任何文字編輯器
   ```

2. **設置執行權限**
   ```bash
   chmod +x build.sh
   ```

3. **執行一鍵編譯**
   ```bash
   ./build.sh
   ```

**腳本功能特色：**
- 🔍 **自動檢測**：確認是否在正確的專案目錄
- 🧹 **自動清理**：清理舊的建置檔案
- 📱 **自動安裝**：編譯完成後自動安裝到模擬器
- 🚀 **自動啟動**：安裝完成後自動啟動 App
- 🌐 **雙語提示**：中英文友善提示訊息
- 🔧 **錯誤處理**：詳細的錯誤診斷和解決建議

### 真機測試
1. 連接 iOS 設備到 Mac
2. 在 Xcode 中信任開發者證書
3. 編譯並安裝到設備

### 📝 編譯注意事項

#### 音效檔案設置
如要使用自訂的 `woof.wav` 音效：

1. **放置檔案**
   ```
   MindfulnessTracker/
   └── woof.wav  ← 放在這裡
   ```

2. **加入專案**
   - 在 Xcode 中右鍵點擊 `MindfulnessTracker` 資料夾
   - 選擇 "Add Files to MindfulnessTracker"
   - 勾選 "Add to target: MindfulnessTracker"

3. **重新編譯**
   - App 會自動偵測並使用 `woof.wav` 檔案
   - 如找不到檔案，會自動回退到系統音效

#### 常見編譯問題

**問題：找不到模擬器**
```bash
# 查看可用模擬器
xcrun simctl list devices

# 建立新模擬器
xcrun simctl create "iPhone 15 Pro Test" "iPhone 15 Pro" "iOS 18.5"
```

**問題：編譯失敗**
```bash
# 清理 DerivedData
rm -rf ~/Library/Developer/Xcode/DerivedData

# 重新編譯
xcodebuild clean build
```

**問題：權限不足**
```bash
# 確保有執行權限
sudo xcode-select --install
```

## 🎨 自訂功能

### 音效替換
若要使用真實的狗叫聲：
1. 準備 `woof.wav` 音效檔
2. 將檔案拖入 Xcode 專案
3. 取消註解 `ContentView.swift` 中的音效播放程式碼

### 🐕 按鈕圖片替換
若要使用自訂的狗狗圖片作為按鈕：

1. **準備圖片檔案**
   - 建議使用 PNG 格式，支援透明背景
   - 建議尺寸：200x200 像素或更大
   - 圖片應為正方形，程式會自動裁切為圓形

2. **添加到專案**
   ```bash
   # 將您的 Dog.png 複製到正確位置
   cp /path/to/your/Dog.png MindfulnessTracker/Assets.xcassets/Dog.imageset/
   ```

3. **在 Xcode 中添加**
   - 打開 Xcode 專案
   - 在左側導航中找到 `Assets.xcassets`
   - 展開 `Dog.imageset` 資料夾
   - 將您的 `Dog.png` 拖入 `1x` 欄位

4. **重新編譯**
   - 程式會自動使用新的狗狗圖片
   - 如果找不到圖片，會自動回退到 表情符號

### 提醒文字客製化
在 `ContentView.swift` 的 `showReminderMessage()` 方法中修改 `messages` 陣列：

```swift
let messages = [
    "您的自訂提醒文字 🌟",
    "其他提醒語句 ✨",
    // 新增更多...
]
```

### 視覺效果調整
可在 `setupUI()` 方法中修改：
- 按鈕顏色：`backgroundColor`
- 文字顏色：`textColor`
- 字體大小：`font`

## 🧘 正念練習建議

### 使用時機
- 工作時注意力分散
- 學習時思緒飄散
- 冥想時妄念紛飛
- 日常生活中的任何時刻

### 配合練習
1. **覺察訓練** - 單純注意妄念的出現，不評判
2. **數息法** - 結合呼吸覺察使用
3. **身體掃描** - 配合身體覺察練習
4. **行禪** - 走路時的覺察練習

### 統計分析
- 觀察每日妄念次數變化
- 找出妄念高發時段
- 發現個人妄念模式
- 追蹤正念訓練進展

## 📊 數據功能

### 自動重置
- 每日計數會在新的一天自動重置
- 保持簡潔的當日專注模式

### 擴展可能
未來版本可考慮加入：
- 週統計和月統計
- 妄念類型分類
- 時間段分析
- 匯出功能

## 🤝 貢獻指南

歡迎提出改進建議或功能請求！

### 可改進方向
- 新增音效選擇
- 增加統計圖表
- 加入提醒排程
- 支援多語言介面
- Apple Watch 版本

## 📄 授權

此專案採用 MIT 授權條款。

## 🙏 致謝

- 靈感來源：[Panic Tracker: The Red Button](https://apps.apple.com/tw/app/panic-tracker-the-red-button/id6743371838?l=en-GB)
- 正念練習理念來自佛教禪修傳統
- 感謝所有正念練習者的智慧分享

---

**願此 App 幫助您培養覺察力，活在當下的每一刻 🙏✨**
