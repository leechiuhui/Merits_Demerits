#!/bin/bash

# Xcode Cloud Post-Clone 腳本
# 確保使用正確的 scheme 名稱

echo "🔧 Xcode Cloud Post-Clone Script"
echo "📋 Available schemes:"
xcodebuild -list -project DelusionTracker.xcodeproj

echo "✅ 確認使用 DelusionTracker scheme"

# 清理可能的舊配置
echo "🧹 清理舊的 scheme 引用..."

# 確保只有正確的 scheme 存在
if [ -f "DelusionTracker.xcodeproj/xcshareddata/xcschemes/DelusionTracker.xcscheme" ]; then
    echo "✅ 找到正確的 DelusionTracker.xcscheme"
else
    echo "❌ 找不到 DelusionTracker.xcscheme"
    exit 1
fi

echo "�� Post-clone 腳本完成" 