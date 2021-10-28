# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'YorozuyaApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for YorozuyaApp
  pod 'IQKeyboardManagerSwift'
  pod 'PKHUD', '~> 5.0'
  pod 'Firebase'
  pod 'Firebase/Firestore'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'EMAlertController'
  pod 'SDWebImage', '~> 5.0'
  pod 'KeychainSwift', '~> 19.0'
  pod 'lottie-ios'
  pod 'ImpressiveNotifications'
  pod 'MessageKit'
  pod 'MessageInputBar'
  pod 'Hex'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
    end
  end

end
