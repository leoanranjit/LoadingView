#
# Be sure to run `pod lib lint LoadingView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoadingView'
  s.version          = '0.1.1'
  s.summary          = 'Loading animation for UIView along with easy customization.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'Loading view is a interactive loading indicator that can be used with any UIView. It also contains easy customization of the loading indicator along with customization to its border, shadow and corner radius. Now compatible with iOS 10.0 and above!'
                       DESC

  s.homepage         = 'https://github.com/leoanranjit/LoadingView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leoanranjit' => 'demonlr509@gmail.com' }
  s.source           = { :git => 'https://github.com/leoanranjit/LoadingView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/**/*.swift'
  s.swift_versions = '5.0'
  s.platforms = {
      "ios": "10.0"
  }
  
  # s.resource_bundles = {
  #   'LoadingView' => ['LoadingView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


