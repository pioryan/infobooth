ActiveSupport.on_load(:action_controller) do
  include ::ModelBasedSecurity::CurrentActor::ActionController
  include ::ModelBasedSecurity::SecurityChecks::ActionController
end

ActiveSupport.on_load(:active_record) do
  include ::ModelBasedSecurity::CurrentActor::Model
  include ::ModelBasedSecurity::SecurityChecks::ActiveRecord
end