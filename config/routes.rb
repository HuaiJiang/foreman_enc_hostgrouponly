Rails.application.routes.draw do

  match 'node_hgonly/:name', :to => 'foreman_enc_hostgrouponly/hosts#node_hgonly',:constraints => { :name => /[^\.][\w\.-]+/ }

end
