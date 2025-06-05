#!/bin/bash

# 妄念追蹤器 - 一鍵編譯腳本
# DelusionTracker - One-Click Build Script

echo "🔨 開始編譯 DelusionTracker..."
echo "🔨 Starting to build DelusionTracker..."

# 檢查是否在正確的目錄
if [ ! -f "DelusionTracker.xcodeproj/project.pbxproj" ]; then
    echo "❌ 錯誤：請在 DelusionTracker 專案根目錄中執行此腳本"
    echo "❌ Error: Please run this script in the DelusionTracker project root directory"
    exit 1
fi

# 清理並編譯
echo "🧹 清理舊的建置檔案..."
echo "🧹 Cleaning old build files..."

xcodebuild -project DelusionTracker.xcodeproj \
  -scheme DelusionTracker \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro Test,OS=18.5' \
  clean build

# 檢查編譯結果
if [ $? -eq 0 ]; then
    echo "✅ 編譯成功！"
    echo "✅ Build successful!"
    
    # 找到 App 路徑
    echo "🔍 尋找編譯後的 App..."
    echo "🔍 Looking for compiled app..."
    
    APP_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "DelusionTracker.app" -path "*/Debug-iphonesimulator/*" | head -1)
    
    if [ -n "$APP_PATH" ]; then
        echo "📱 安裝 App 到模擬器..."
        echo "📱 Installing app to simulator..."
        
        xcrun simctl install 'iPhone 15 Pro Test' "$APP_PATH"
        
        if [ $? -eq 0 ]; then
            echo "🚀 啟動 App..."
            echo "🚀 Launching app..."
            
            xcrun simctl launch 'iPhone 15 Pro Test' com.delusion.tracker
            
            if [ $? -eq 0 ]; then
                echo ""
                echo "🎉 完成！App 已在模擬器中運行"
                echo "🎉 Done! App is now running in simulator"
                echo ""
                echo "📱 妄念追蹤器已準備就緒，開始您的正念練習！"
                echo "📱 DelusionTracker is ready, start your delusion practice!"
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