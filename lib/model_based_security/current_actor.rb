module ModelBasedSecurity
  module CurrentActor
    module ActionController
      def self.included(controller)
        controller.module_eval do
          include InstanceMethods
          attr_reader :current_actor
          helper_method :current_actor
        end
      end

      module InstanceMethods

        def current_actor_assignment
          load_current_actor
          yield
        ensure
          clear_current_actor
        end

        def current_actor=(actor)
          @current_actor = actor
          ::ActiveRecord::Base.current_actor = actor
        end
      end
    end

    module Model
      def self.included(model)
        model.module_eval do
          extend ClassMethods
          include InstanceMethods
        end
      end

      module ClassMethods
        # these can't be a cattr_accessor because the instance
        # methods in the mixin need to take priority over the cattr_accessor

        # We store this value on the current thread because storing it on the class makes this entirely not thread-
        # safe.  A more appropriate solution would be to have the enclosing scope (the controller instance, for
        # example) manage this value.  We made the change this way to allow backwards compatibility with the old,
        # class variable implementation.

        def current_actor
          Thread.current[:current_actor]
        end

        def current_actor=(current_actor)
          Thread.current[:current_actor] = current_actor
        end
      end

      module InstanceMethods
        attr_writer :current_actor

        def current_actor
          @current_actor || self.class.current_actor
        end
      end
    end
  end
end