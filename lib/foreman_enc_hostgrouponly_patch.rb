module ForemanEncHostgrouponlyPatch
  def self.included(base)
      #base.extend ClassMethods
      base.class_eval do
          alias_method_chain :hashed_class_parameters, :hostgrouponly
        end
      end

       # create or overwrite class methods...
      def hashed_class_parameters_with_hostgrouponly
        unless Setting[:enc_hostgrouponly]
          Rails.logger.debug "ForemanEncHostgrouponlyPatch: return all"
          return hashed_class_parameters_without_hostgrouponly
        end

        Rails.logger.debug "ForemanEncHostgrouponlyPatch: return host group parameters only"
        h = {}
        begin
         hostgroup_matches = []
          possible_value_orders.each do |rule|
            match = Array.wrap(rule).map do |element|
              "#{element}#{LookupKey::EQ_DELM}#{attr_to_value(element)}"
            end if Array.wrap(rule).include?("hostgroup")
            if match
              hostgroup_matches << match.join(LookupKey::KEY_DELM)
            end
          end

          hostgroup_matches.each do |hostgroup_match|
            LookupValue.where(:match => hostgroup_match).where(:lookup_key_id => class_parameters.map(&:id)).each do |value|
              key = class_parameters.detect{|k| k.id == value.lookup_key_id }
              Rails.logger.debug "ForemanEncHostgrouponlyPatch: detect host group parameters (#{key.to_s})"
              klass_id = key.environment_classes.first.puppetclass_id
              h[klass_id] ||= []
              h[klass_id] << key
            end
          end
        h
        rescue => e
          Rails.logger.error "ForemanEncHostgrouponly: skipping engine hook (#{e.to_s})"
        end
      end

  end
