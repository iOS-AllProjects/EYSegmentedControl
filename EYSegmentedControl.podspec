Pod::Spec.new do |s|
  s.name             = 'EYSegmentedControl'
  s.version          = '0.1.0'
  s.summary          = 'Custom Segmented Control'
 
  s.description      = <<-DESC
Fully customisable, comes in two styles radius and flat!!
                       DESC
 
  s.homepage         = 'https://github.com/iOS-AllProjects/EYSegmentedControl'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Etjen Ymeraj>' => '<etjenymeraj@gmail.com>' }
  s.source           = { :git => 'https://github.com/iOS-AllProjects/EYSegmentedControl.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'EYSegmentedControl/CustomSegmentedControl.swift'
 
end