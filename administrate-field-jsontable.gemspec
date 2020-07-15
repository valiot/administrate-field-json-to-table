$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name = 'administrate-field-jsontable'
  s.version = '0.0.4'
  s.authors = ['Adrian Rangel', 'Enrique Barragan']
  s.email = ['adrian@valiot.io', 'enrique@valiot.io']
  s.homepage = 'https://github.com/Valiot/administrate-field-jsontable'
  s.summary = 'JSON to table field plugin for Administrate'
  s.description = s.summary
  s.license = 'MIT'

  s.require_paths = ['lib']
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency 'administrate'
  s.add_dependency 'rails', '>= 4.2'
end
