#!/bin/bash

# 妄念追蹤器 - 自動截圖腳本
# delusionTracker - Auto Screenshot Script

echo "📸 開始 App 截圖拍攝流程..."
echo "📸 Starting App screenshot process..."

# 檢查是否有編譯好的 App
if [ ! -d "$HOME/Library/Developer/Xcode/DerivedData" ]; then
    echo "❌ 找不到 Xcode DerivedData"
    echo "❌ Xcode DerivedData not found"
    echo "💡 請先運行 ./build.sh 編譯 App"
    echo "💡 Please run ./build.sh first to build the app"
    exit 1
fi

# 尋找最新編譯的 App
APP_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "delusionTracker.app" -path "*/Debug-iphonesimulator/*" | head -1)

if [ -z "$APP_PATH" ]; then
    echo "❌ 找不到編譯好的 App"
    echo "❌ Compiled app not found"
    echo "🔨 正在編譯 App..."
    echo "🔨 Building app..."
    ./build.sh
    
    # 重新尋找 App
    APP_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "delusionTracker.app" -path "*/Debug-iphonesimulator/*" | head -1)
    
    if [ -z "$APP_PATH" ]; then
        echo "❌ 編譯失敗，無法找到 App"
        echo "❌ Build failed, app not found"
        exit 1
    fi
fi

echo "✅ 找到 App: $APP_PATH"
echo "✅ Found app: $APP_PATH"

# 創建截圖目錄
echo "📁 創建截圖目錄..."
echo "📁 Creating screenshot directories..."
mkdir -p Screenshots/iPhone_{6.7,6.1,5.5}

# 拍攝截圖的函數
take_screenshots_for_device() {
    local sim_name="$1"
    local folder_name="$2"
    local resolution="$3"
    
    echo ""
    echo "📱 開始拍攝 $sim_name 截圖 ($resolution)..."
    echo "📱 Starting screenshots for $sim_name ($resolution)..."
    
    # 檢查模擬器是否存在
    if ! xcrun simctl list devices | grep -q "$sim_name"; then
        echo "❌ 模擬器 '$sim_name' 不存在"
        echo "❌ Simulator '$sim_name' does not exist"
        echo "💡 請先創建所需的模擬器"
        echo "💡 Please create required simulators first"
        return 1
    fi
    
    # 啟動模擬器
    echo "🚀 啟動模擬器..."
    echo "🚀 Booting simulator..."
    xcrun simctl boot "$sim_name" 2>/dev/null
    
    # 等待模擬器啟動
    sleep 5
    
    # 安裝 App
    echo "📦 安裝 App..."
    echo "📦 Installing app..."
    xcrun simctl install "$sim_name" "$APP_PATH"
    
    if [ $? -ne 0 ]; then
        echo "❌ App 安裝失敗"
        echo "❌ App installation failed"
        return 1
    fi
    
    # 等待安裝完成
    sleep 2
    
    # 啟動 App
    echo "🚀 啟動 App..."
    echo "🚀 Launching app..."
    xcrun simctl launch "$sim_name" com.delusion.tracker
    
    # 等待 App 完全載入
    sleep 3
    
    # 拍攝主畫面截圖
    echo "📷 拍攝主畫面..."
    echo "📷 Taking main screen screenshot..."
    xcrun simctl io "$sim_name" screenshot "Screenshots/$folder_name/01_main_screen.png"
    
    echo "✅ $sim_name 主畫面截圖完成"
    echo "✅ $sim_name main screen screenshot completed"
    
    # 暫停讓用戶手動操作
    echo ""
    echo "🎯 現在請在模擬器中進行以下操作："
    echo "🎯 Now please perform these actions in the simulator:"
    echo "   1. 按下狗狗按鈕一次"
    echo "   1. Press the dog button once"
    echo "   2. 等待提醒文字出現"
    echo "   2. Wait for reminder text to appear"
    echo "   3. 按 Enter 繼續下一張截圖"
    echo "   3. Press Enter for next screenshot"
    echo ""
    read -p "按 Enter 繼續... / Press Enter to continue..."
    
    # 拍攝使用中畫面
    echo "📷 拍攝使用中畫面..."
    echo "📷 Taking in-use screenshot..."
    xcrun simctl io "$sim_name" screenshot "Screenshots/$folder_name/02_button_pressed.png"
    
    echo "🎯 請再按幾次按鈕，讓計數增加到 3-5 次"
    echo "🎯 Please press the button a few more times, increase count to 3-5"
    echo "按 Enter 繼續... / Press Enter to continue..."
    read
    
    # 拍攝統計畫面
    echo "📷 拍攝統計畫面..."
    echo "📷 Taking statistics screenshot..."
    xcrun simctl io "$sim_name" screenshot "Screenshots/$folder_name/03_statistics.png"
    
    echo "🎯 請再按一次按鈕讓提醒文字出現"
    echo "🎯 Please press button once more to show reminder text"
    echo "按 Enter 繼續... / Press Enter to continue..."
    read
    
    # 拍攝提醒顯示畫面
    echo "📷 拍攝提醒顯示畫面..."
    echo "📷 Taking reminder display screenshot..."
    xcrun simctl io "$sim_name" screenshot "Screenshots/$folder_name/04_reminder_shown.png"
    
    echo "✅ $sim_name 所有截圖完成！"
    echo "✅ All screenshots for $sim_name completed!"
    
    echo "📁 截圖保存位置: Screenshots/$folder_name/"
    echo "📁 Screenshots saved to: Screenshots/$folder_name/"
}

# 拍攝各設備截圖
echo ""
echo "📱 開始拍攝各設備截圖..."
echo "📱 Starting screenshots for all devices..."

# iPhone 15 Pro Max (6.7")
take_screenshots_for_device "iPhone 15 Pro Max Screenshot" "iPhone_6.7" "1290x2796"

# iPhone 15 Pro (6.1") - 使用現有的 iPhone 15 Pro Test
take_screenshots_for_device "iPhone 15 Pro Test" "iPhone_6.1" "1179x2556"

# iPhone 16 (5.5" 替代)
take_screenshots_for_device "iPhone 16" "iPhone_5.5" "1242x2208"

echo ""
echo "🎉 所有設備截圖拍攝完成！"
echo "🎉 All device screenshots completed!"

echo ""
echo "📊 截圖摘要 / Screenshot Summary:"
echo "======================================"

# 檢查並顯示截圖文件
for folder in Screenshots/iPhone_*; do
    if [ -d "$folder" ]; then
        echo "📁 $folder:"
        for file in "$folder"/*.png; do
            if [ -f "$file" ]; then
                file_size=$(du -h "$file" | cut -f1)
                echo "   📷 $(basename "$file") ($file_size)"
            fi
        done
        echo ""
    fi
done

echo "🎯 下一步驟 / Next Steps:"
echo "========================="
echo "1. 📂 檢查截圖品質和內容"
echo "1. 📂 Check screenshot quality and content"
echo "2. 🎨 如需要，可用圖片編輯軟體添加說明文字"
echo "2. 🎨 Add description text with image editor if needed"
echo "3. 📱 到 App Store Connect 上傳截圖"
echo "3. 📱 Upload screenshots to App Store Connect"
echo "4. 🔗 網址: https://appstoreconnect.apple.com/"
echo "4. 🔗 URL: https://appstoreconnect.apple.com/"

echo ""
echo "📋 截圖品質檢查清單 / Screenshot Quality Checklist:"
echo "=================================================="
echo "- [ ] 解析度正確 / Correct resolution"
echo "- [ ] 圖片清晰 / Clear images"  
echo "- [ ] 顯示真實功能 / Shows real functionality"
echo "- [ ] 文字可讀 / Text is readable"
echo "- [ ] 無測試數據 / No test data"
echo "- [ ] 界面完整 / Complete interface"

echo ""
echo "💡 小提示 / Tips:"
echo "================"
echo "• 第一張截圖最重要，會在搜索結果中顯示"
echo "• First screenshot is most important for search results"
echo "• 建議上傳 4-5 張最好的截圖"
echo "• Recommend uploading 4-5 best screenshots"
echo "• 確保截圖展示核心功能價值"
echo "• Ensure screenshots showcase core value"

echo ""
echo "✨ 截圖拍攝完成！準備上架 App Store！"
echo "✨ Screenshots completed! Ready for App Store submission!" 