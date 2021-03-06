Gem::Specification.new do |s|
  s.name        = 'seolicious'
  s.version     = '0.0.1'
  s.summary     = "manage meta data and og/twitter information for pages easily"
  s.description = "allow to manage SEO data like OG image/title/description and some other SEO relevant attributes from ActiveAdmin Panel. Custom Integration is also possible."
  s.authors     = ["Florian Eck"]
  s.email       = 'florian.eck@el-digital.de'
  s.files       = [Dir.glob("lib/**/*"), Dir.glob("app/**/*"), Dir.glob("config/**/*")].flatten
  s.test_files  =   Dir.glob("test/**/*")
  s.homepage    = 'https://github.com/florianeck/seolicious'

  s.add_dependency "rails"
  s.add_dependency 'carrierwave'
  s.add_dependency 'rmagick'
end