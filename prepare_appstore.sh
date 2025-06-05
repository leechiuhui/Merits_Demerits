#!/bin/bash

# 妄念追蹤器 - App Store 準備腳本
# delusionTracker - App Store Preparation Script

echo "🚀 開始準備 App Store 上架..."
echo "🚀 Starting App Store preparation..."

# 檢查開發者帳號
echo "📱 步驟 1: 檢查開發者配置"
echo "📱 Step 1: Check developer configuration"

# 檢查是否有開發者證書
if ! security find-identity -v -p codesigning | grep -q "iPhone Distribution"; then
    echo "⚠️  警告：未找到 App Store 發布證書"
    echo "⚠️  Warning: App Store distribution certificate not found"
    echo "💡 請先到 Apple Developer Portal 創建證書："
    echo "💡 Please create certificate at Apple Developer Portal:"
    echo "   https://developer.apple.com/account/resources/certificates/list"
    echo ""
fi

# 檢查 Provisioning Profile
echo "📱 步驟 2: 檢查 Provisioning Profile"
echo "📱 Step 2: Check Provisioning Profile"

# 創建 Release 版本編譯
echo "🔨 步驟 3: 創建 Release 版本"
echo "🔨 Step 3: Create Release build"

xcodebuild -project delusionTracker.xcodeproj \
  -scheme delusionTracker \
  -configuration Release \
  -destination generic/platform=iOS \
  archive -archivePath ./delusionTracker.xcarchive

if [ $? -eq 0 ]; then
    echo "✅ Release 版本編譯成功！"
    echo "✅ Release build successful!"
    
    echo "📤 步驟 4: 匯出 IPA 檔案"
    echo "📤 Step 4: Export IPA file"
    
    # 創建匯出選項
    cat > ExportOptions.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>app-store</string>
    <key>teamID</key>
    <string>YOUR_TEAM_ID</string>
    <key>uploadBitcode</key>
    <false/>
    <key>uploadSymbols</key>
    <true/>
    <key>compileBitcode</key>
    <false/>
</dict>
</plist>
EOF

    # 匯出 IPA
    xcodebuild -exportArchive \
      -archivePath ./delusionTracker.xcarchive \
      -exportPath ./AppStore \
      -exportOptionsPlist ./ExportOptions.plist
    
    if [ $? -eq 0 ]; then
        echo "✅ IPA 檔案匯出成功！"
        echo "✅ IPA export successful!"
        echo "📍 位置: ./AppStore/delusionTracker.ipa"
        echo "📍 Location: ./AppStore/delusionTracker.ipa"
        
        echo ""
        echo "🎯 下一步驟："
        echo "🎯 Next steps:"
        echo "1. 開啟 Application Loader 或 Transporter"
        echo "1. Open Application Loader or Transporter"
        echo "2. 上傳 IPA 檔案到 App Store Connect"
        echo "2. Upload IPA file to App Store Connect"
        echo "3. 到 App Store Connect 網站完成 App 資訊"
        echo "3. Complete app information on App Store Connect website"
    else
        echo "❌ IPA 匯出失敗"
        echo "❌ IPA export failed"
    fi
else
    echo "❌ Release 版本編譯失敗"
    echo "❌ Release build failed"
    echo "💡 請檢查證書和 Provisioning Profile 設定"
    echo "💡 Please check certificate and provisioning profile settings"
fi

echo ""
echo "📚 更多資源："
echo "📚 More resources:"
echo "- App Store Connect: https://appstoreconnect.apple.com/"
echo "- 審核指南: https://developer.apple.com/app-store/review/guidelines/"
echo "- 人機介面指南: https://developer.apple.com/design/human-interface-guidelines/" 