class Setting::Enc_Hostgrouponly < Setting

  def self.load_defaults
    # Check the table exists
    puts "loading hostgrouponly"

    return unless super

      Setting.transaction do
        [
          self.set('enc_hostgrouponly', 'Foreman ENC return host group parameters only', false),
        ].compact.each { |s| self.create s.update(:category => 'Setting::General')}
      end

    true

  end

end
