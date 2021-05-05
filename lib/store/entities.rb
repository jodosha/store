# auto_register: false
# frozen_string_literal: true

module Store
  module Entities
  end
end

Dir[File.join(__dir__, "entities", "*.rb")].each(&method(:require))
