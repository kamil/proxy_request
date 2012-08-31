# coding: utf-8
Gem::Specification.new do |s|
  s.name        = 'proxy_request'
  s.platform    = Gem::Platform::RUBY
  s.version     = '0.0.2'
  s.summary     = "Proxy request helper for yours Rails routes."
  s.description = "Proxy request helper for yours Rails routes."
  s.author      = "Kamil Zaleski"
  s.email       = 'kamil.zaleski@gmail.com'
  s.files       = ["lib/proxy_request.rb"]
  s.homepage    = 'http://github.com/kamil/proxy_request'
  s.add_runtime_dependency "httpclient"
end
