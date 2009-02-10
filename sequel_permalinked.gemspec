SPEC = Gem::Specification.new do |s|
  # identify the gem
  s.name = "sequel_permalinked"
  s.version = "1.0.0"
  s.author = "S. Brent Faulkner"
  s.email = "brentf@unwwwired.net"
  s.homepage = "http://github.com/sbfaulkner/sequel_permalinked"
  # platform of choice
  s.platform = Gem::Platform::RUBY
  # description of gem
  s.summary = "my take on a permalinking plugin for sequel"
  s.files = %w(lib/sequel_permalinked.rb MIT-LICENSE Rakefile README.markdown sequel_permalinked.gemspec test/sequel_permalinked_test.rb)
  s.require_path = "lib"
  s.test_file = "test/sequel_permalinked_test.rb"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown"]
  s.add_dependency "sequel"
  # s.rubyforge_project = "sequel_permalinked"
end
