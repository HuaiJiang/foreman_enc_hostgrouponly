require 'deface'

module ForemanEncHostgrouponly
  class Engine < ::Rails::Engine

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Add any db migrations
    initializer "foreman_enc_hostgrouponly.load_app_instance_data" do |app|
      app.config.paths['db/migrate'] += ForemanEncHostgrouponly::Engine.paths['db/migrate'].existent
    end

    initializer 'foreman_enc_hostgrouponly.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_enc_hostgrouponly do
        requires_foreman '>= 1.5'


        # Add a new role called 'Discovery' if it doesn't exist
        role "ForemanEncHostgrouponly", [:view_foreman_enc_hostgrouponly]


      end
    end

    #Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        Host::Managed.send(:include, ForemanEncHostgrouponly::HostExtensions)
        HostsHelper.send(:include, ForemanEncHostgrouponly::HostsHelperExtensions)
      rescue => e
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
