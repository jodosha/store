# frozen_string_literal: true

require "store/repository"
require_relative "entities"

module Main
  class Repository < Store::Repository
    struct_namespace Entities
  end
end
