#!/bin/bash

set -e  # 在遇到錯誤時退出

# Xcode Cloud Post-Clone 腳本
# 確保使用正確的 scheme 名稱

echo "🔧 Xcode Cloud Post-Clone Script 開始"
echo "📂 當前目錄: $(pwd)"
echo "📋 目錄內容:"
ls -la

echo ""
echo "🔍 檢查項目文件..."
if [ -f "DelusionTracker.xcodeproj/project.pbxproj" ]; then
    echo "✅ 找到 DelusionTracker.xcodeproj"
else
    echo "❌ 找不到 DelusionTracker.xcodeproj"
    ls -la
    exit 1
fi

echo ""
echo "📋 Available schemes:"
xcodebuild -list -project DelusionTracker.xcodeproj || {
    echo "❌ xcodebuild -list 失敗"
    exit 1
}

echo ""
echo "🔍 檢查共享 scheme 文件..."
SCHEME_PATH="DelusionTracker.xcodeproj/xcshareddata/xcschemes/DelusionTracker.xcscheme"
if [ -f "$SCHEME_PATH" ]; then
    echo "✅ 找到正確的 DelusionTracker.xcscheme"
    echo "📁 Scheme 文件路徑: $SCHEME_PATH"
    ls -la "DelusionTracker.xcodeproj/xcshareddata/xcschemes/"
else
    echo "❌ 找不到 DelusionTracker.xcscheme"
    echo "📁 檢查 xcshareddata 目錄結構:"
    find DelusionTracker.xcodeproj -name "*.xcscheme" -type f || echo "沒有找到任何 .xcscheme 文件"
    exit 1
fi

echo ""
echo "�� Post-clone 腳本完成" 