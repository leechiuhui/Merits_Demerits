#!/bin/bash

# 添加狗狗圖片到 MindfulnessTracker 專案
# Add Dog Image to MindfulnessTracker Project

echo "🐕 開始添加狗狗圖片到專案..."
echo "🐕 Starting to add dog image to project..."

# 檢查是否在正確的目錄
if [ ! -f "MindfulnessTracker.xcodeproj/project.pbxproj" ]; then
    echo "❌ 錯誤：請在 MindfulnessTracker 專案根目錄中執行此腳本"
    echo "❌ Error: Please run this script in the MindfulnessTracker project root directory"
    exit 1
fi

# 檢查 Dog.png 是否存在
if [ ! -f "Dog.png" ]; then
    echo "❌ 找不到 Dog.png 檔案"
    echo "❌ Dog.png file not found"
    echo ""
    echo "📋 請確保："
    echo "📋 Please ensure:"
    echo "1. Dog.png 檔案位於專案根目錄"
    echo "1. Dog.png file is in the project root directory"
    echo "2. 檔案名稱正確（區分大小寫）"
    echo "2. Filename is correct (case sensitive)"
    exit 1
fi

# 檢查目標目錄是否存在
TARGET_DIR="MindfulnessTracker/Assets.xcassets/Dog.imageset"
if [ ! -d "$TARGET_DIR" ]; then
    echo "📁 創建 Dog.imageset 目錄..."
    echo "📁 Creating Dog.imageset directory..."
    mkdir -p "$TARGET_DIR"
fi

# 複製圖片
echo "📋 複製 Dog.png 到專案..."
echo "📋 Copying Dog.png to project..."

cp Dog.png "$TARGET_DIR/"

if [ $? -eq 0 ]; then
    echo "✅ 圖片添加成功！"
    echo "✅ Image added successfully!"
    echo ""
    echo "📱 下一步："
    echo "📱 Next steps:"
    echo "1. 使用 ./build.sh 重新編譯專案"
    echo "1. Rebuild project using ./build.sh"
    echo "2. 或在 Xcode 中重新編譯 (⌘+R)"
    echo "2. Or rebuild in Xcode (⌘+R)"
    echo ""
    echo "🎉 現在按鈕將顯示您的狗狗圖片！"
    echo "🎉 Button will now display your dog image!"
else
    echo "❌ 複製圖片失敗"
    echo "❌ Failed to copy image"
    exit 1
fi 