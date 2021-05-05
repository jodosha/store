# frozen_string_literal: true

require "store/types"

Hanami.application.settings do
  # Framework
  setting :log_to_stdout, Store::Types::Params::Bool.optional.default(false)

  # Database
  setting :database_url, Store::Types::String

  # Application
  setting :session_secret, Store::Types::String

  # Assets
  setting :precompiled_assets, Store::Types::Params::Bool.optional.default(false)
  setting :assets_server_url, Store::Types::String.optional.default("http://localhost:8080")
end
