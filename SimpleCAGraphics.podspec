Pod::Spec.new do |s|
  s.name = 'SimpleCAGraphics'
  s.version = 'v1.0.0'
  s.license = 'MIT'
  s.summary = 'Easy access to Core Animation graphics.'
  s.homepage = 'https://github.com/KinkumaDesign/SimpleCAGraphics'
  s.authors = "Tasuku Maeda (KinkumaDesign)"
  
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  
  s.source = { :git => 'https://github.com/KinkumaDesign/SimpleCAGraphics.git', :tag => s.version }
  s.source_files = 'SimpleCAGraphics/Source/*.swift'
end
