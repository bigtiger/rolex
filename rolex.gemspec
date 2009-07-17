# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rolex}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["bigtiger", "sandro"]
  s.date = %q{2009-07-17}
  s.default_executable = %q{rolex}
  s.email = %q{dev+bigtiger+sandro@hashrocket.com}
  s.executables = ["rolex"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/rolex",
     "lib/float_ext.rb",
     "lib/rolex.rb",
     "lib/rolex/line_item.rb",
     "lib/rolex/report.rb",
     "lib/time_ext.rb",
     "rolex.gemspec",
     "spec/rolex/line_item_spec.rb",
     "spec/rolex_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bigtiger/rolex}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/rolex/line_item_spec.rb",
     "spec/rolex_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mojombo-grit>, [">= 1.1.1"])
      s.add_runtime_dependency(%q<mojombo-chronic>, [">= 0.3.0"])
      s.add_runtime_dependency(%q<trollop>, [">= 1.14"])
    else
      s.add_dependency(%q<mojombo-grit>, [">= 1.1.1"])
      s.add_dependency(%q<mojombo-chronic>, [">= 0.3.0"])
      s.add_dependency(%q<trollop>, [">= 1.14"])
    end
  else
    s.add_dependency(%q<mojombo-grit>, [">= 1.1.1"])
    s.add_dependency(%q<mojombo-chronic>, [">= 0.3.0"])
    s.add_dependency(%q<trollop>, [">= 1.14"])
  end
end
