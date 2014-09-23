require 'deface'
require 'foreman_enc_hostgrouponly_patch'

module ForemanEncHostgrouponly
  class Engine < ::Rails::Engine

    #config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    #config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    #config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    #config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Load this before the Foreman config initizializers, so that the Setting.descendants
    # list includes the plugin STI setting class
    initializer 'foreman_discovery.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path("../../../app/models/setting/enc_hostgrouponly.rb", __FILE__) if (Setting.table_exists? rescue(false))
    end

    initializer 'foreman_enc_hostgrouponly.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_enc_hostgrouponly do
        requires_foreman '>= 1.5'

   end
    end

    #Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
   #     Host::Managed.send(:include, ForemanEncHostgrouponly::HostExtensions)
   #     HostsHelper.send(:include, ForemanEncHostgrouponly::HostsHelperExtensions)
         Classification::ClassParam.send(:include, ForemanEncHostgrouponlyPatch)
      rescue => e
        puts e.backtrace
        puts "ForemanEncHostgrouponly: skipping engine hook (#{e.to_s})"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanEncHostgrouponly::Engine.load_seed
      end
    end

  end
end
