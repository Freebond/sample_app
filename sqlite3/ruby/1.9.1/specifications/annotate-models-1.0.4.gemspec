# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{annotate-models}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Thomas"]
  s.date = %q{2008-09-04}
  s.description = %q{Add a comment summarizing the current schema to the top of each ActiveRecord model source file}
  s.email = ["ctran@pragmaquest.com"]
  s.executables = ["annotate"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "website/index.txt"]
  s.files = ["bin/annotate", "History.txt", "License.txt", "Manifest.txt", "README.txt", "website/index.txt"]
  s.homepage = %q{http://annotate-models.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{annotate-models}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Add a comment summarizing the current schema to the top of each ActiveRecord model source file}

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
