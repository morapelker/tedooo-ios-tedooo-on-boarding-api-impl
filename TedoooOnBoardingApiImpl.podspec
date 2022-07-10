#
# Be sure to run `pod lib lint TedoooOnBoardingApiImpl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TedoooOnBoardingApiImpl'
  s.version          = '1.1.1'
  s.summary          = 'TedoooOnBoardingApiImpl'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TedoooOnBoardingApiImpl
                       DESC

  s.homepage         = 'https://github.com/morapelker/tedooo-ios-tedooo-on-boarding-api-impl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'morapelker' => 'morapelker@gmail.com' }
  s.source           = { :git => 'https://github.com/morapelker/tedooo-ios-tedooo-on-boarding-api-impl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'TedoooOnBoardingApiImpl/Classes/**/*'
  s.swift_version = '5.0'
  # s.resource_bundles = {
  #   'TedoooOnBoardingApiImpl' => ['TedoooOnBoardingApiImpl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'TedoooOnBoardingApi'
  s.dependency 'Swinject'
  s.dependency 'TedoooRestApi'
  
  # s.dependency 'AFNetworking', '~> 2.3'
end
