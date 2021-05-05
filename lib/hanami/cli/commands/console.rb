# frozen_string_literal: true

require "hanami/console/context"

require_relative "../application_command"

module Hanami
  module CLI
    module Commands
      class Console < ApplicationCommand
        desc "Application REPL"

        def call(**opts)
          require "pry"

          prompt = application_prompt

          Pry.config.prompt = Pry::Prompt.new(
            "hanami",
            "my custom prompt",
            [proc { |obj, _| "#{prompt}> " }]
          )

          ctx = Hanami::Console::Context.new(application)

          Pry.start(ctx)
        end

        def application_prompt
          "#{application_name}[#{application_env}]"
        end

        def application_name
          (application.container.config.name || inflector.underscore(application.name)).split("/")[0]
        end

        def application_env
          application.container.env
        end

        def inflector
          application.inflector
        end
      end
    end
  end
end
