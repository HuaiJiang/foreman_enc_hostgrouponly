module ForemanEncHostgrouponly

  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController

    # change layout if needed
    # layout 'foreman_enc_hostgrouponly/layouts/new_layout'

    def node_hgonly
        externalNodes
    end



  def action_permission
    case params[:action]
      when 'node_hgonly'
        :view
      else
        super
    end
  end
  end
end
