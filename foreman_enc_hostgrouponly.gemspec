require File.expand_path('../lib/foreman_enc_hostgrouponly/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "foreman_enc_hostgrouponly"
  s.version     = ForemanEncHostgrouponly::VERSION
  s.date        = Date.today.to_s
  s.authors     = ["Huai Jiang"]
  s.email       = ["huajiang@ebay.com"]
  s.homepage    = "https://github.com/HuaiJiang/foreman_enc_hostgrouponly"
  s.summary     = "get hostgroup param only"
  s.description = "get hostgroup param only"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  #s.add_development_dependency "sqlite3"
end
