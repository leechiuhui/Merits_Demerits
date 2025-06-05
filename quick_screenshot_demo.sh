#!/bin/bash

# 快速截圖演示腳本 - 僅使用現有模擬器
# Quick Screenshot Demo - Using existing simulator only

echo "📸 快速截圖演示 - iPhone 15 Pro Test"
echo "📸 Quick Screenshot Demo - iPhone 15 Pro Test"

# 尋找編譯好的 App
APP_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "delusionTracker.app" -path "*/Debug-iphonesimulator/*" | head -1)

if [ -z "$APP_PATH" ]; then
    echo "❌ 找不到編譯好的 App，請先運行 ./build.sh"
    echo "❌ App not found, please run ./build.sh first"
    exit 1
fi

echo "✅ 找到 App: $APP_PATH"

# 創建截圖目錄
mkdir -p Screenshots/Demo

# 設定模擬器
SIM_NAME="iPhone 15 Pro Test"

echo "📱 使用模擬器: $SIM_NAME"
echo "📱 Using simulator: $SIM_NAME"

# 確保模擬器已啟動
echo "🚀 確保模擬器已啟動..."
echo "🚀 Ensuring simulator is booted..."
xcrun simctl boot "$SIM_NAME" 2>/dev/null

# 等待啟動
sleep 3

# 安裝 App
echo "📦 安裝 App..."
echo "📦 Installing app..."
xcrun simctl install "$SIM_NAME" "$APP_PATH"

# 啟動 App
echo "🚀 啟動 App..."
echo "🚀 Launching app..."
xcrun simctl launch "$SIM_NAME" com.delusion.tracker

# 等待載入
sleep 3

# 拍攝第一張截圖
echo "📷 拍攝主畫面截圖..."
echo "📷 Taking main screen screenshot..."
xcrun simctl io "$SIM_NAME" screenshot "Screenshots/Demo/01_main_screen.png"

echo "✅ 截圖已保存到: Screenshots/Demo/01_main_screen.png"
echo "✅ Screenshot saved to: Screenshots/Demo/01_main_screen.png"

echo ""
echo "🎯 手動操作指南："
echo "🎯 Manual operation guide:"
echo "1. 在模擬器中按下狗狗按鈕"
echo "1. Press the dog button in simulator"
echo "2. 觀察計數變化和提醒文字"
echo "2. Observe count change and reminder text"
echo "3. 使用 ⌘+S 手動拍攝更多截圖"
echo "3. Use ⌘+S to manually take more screenshots"

echo ""
echo "📂 模擬器截圖會自動保存到桌面"
echo "📂 Simulator screenshots auto-save to Desktop"

echo ""
echo "💡 完整截圖指南："
echo "💡 Complete screenshot guide:"
echo "參考 screenshot_guide.md 獲得詳細說明"
echo "Refer to screenshot_guide.md for detailed instructions"

# 檢查截圖
if [ -f "Screenshots/Demo/01_main_screen.png" ]; then
    file_size=$(du -h "Screenshots/Demo/01_main_screen.png" | cut -f1)
    echo ""
    echo "📊 截圖信息："
    echo "📊 Screenshot info:"
    echo "文件大小: $file_size"
    echo "File size: $file_size"
    
    # 獲取圖片尺寸（如果有 sips 命令）
    if command -v sips &> /dev/null; then
        dimensions=$(sips -g pixelWidth -g pixelHeight "Screenshots/Demo/01_main_screen.png" | grep -E "pixelWidth|pixelHeight" | awk '{print $2}' | tr '\n' 'x' | sed 's/x$//')
        echo "圖片尺寸: $dimensions pixels"
        echo "Image dimensions: $dimensions pixels"
    fi
fi

echo ""
echo "🎉 演示完成！"
echo "�� Demo completed!" 