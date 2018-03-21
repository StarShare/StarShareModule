Pod::Spec.new do |s|
  s.name         = "StarShareModule"
  s.version      = "0.0.1"
  s.summary      = "StarShareModule written in Swift"
  s.description  = <<-EOS
  Something.............................................................
  ..........................Fuck!Nothing!. Instructions for installation
  are in [the README](http://git.idoool.com/iOS_modul/StarShareModule).
  EOS
  s.homepage     = "http://git.idoool.com/iOS_modul/StarShareModule"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "wangrui" => "wangrui@bangbangbang.cn" }
  s.social_media_url   = "http://oye.moe"
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "http://git.idoool.com/iOS_modul/StarShareModule.git", :tag => s.version }
  s.source_files  = "StarShareModulePodSpec/Sources/*.swift"
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.0'
  }
  s.requires_arc = true
  s.framework = "Foundation"
  s.framework = "UIKit"
end