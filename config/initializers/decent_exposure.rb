# Patches for Rails 5 and decent exposure
# Put the line below above the require rails line!
# require File.expand_path('../initializers/decent_exposure', __FILE__)
# require 'rails/all'
module DecentExposure
  module Expose
    def hide_action(action)
    end

    def protected_instance_variables
      []
    end
  end
end
