$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "news"
  s.version     = News::VERSION
  s.authors     = ["Seb Ashton"]
  s.email       = ["seb@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk/"
  s.summary     = "News engine."
  s.description = "Rails engine that provides the functionality required to add news to a site"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "paperclip", ">= 3", "< 6"
  s.add_dependency "stringex", "~> 1.5.1"
  s.add_dependency "kaminari"
end
