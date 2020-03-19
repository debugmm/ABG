#
#  Be sure to run `pod spec lint ABG.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "ABG"
  spec.version      = "1.0.0"
  spec.summary      = "ABG是一个用于iOS-OSX平台的中间件，一个轻量级的模块间交互解耦中间件。"

  spec.homepage     = "https://github.com/debugmm/ABG"

  spec.license      = "MIT"


  spec.author             = { "wujungao" => "abuglife@qq.com" }
 
  #spec.ios.deployment_target = "10.0"
  #spec.osx.deployment_target = "10.12"
  
  spec.source       = { :git => "https://github.com/debugmm/ABG.git", :tag => "#{spec.version}" }

  spec.source_files  = "ABG/*.{h,m}"

end
