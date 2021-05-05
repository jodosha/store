# frozen_string_literal: true

require "dry/files"

require_relative "commands/db/utils/database"

module Hanami
  module CLI
    class ApplicationCommand < Hanami::CLI::Command
      def application
        @application ||=
          begin
            require "hanami/init"
            Hanami.application
          end
      end

      def run_command(klass, *args)
        klass.new(
          out: out,
          inflector: application.inflector,
          fs: Dry::Files
        ).call(*args)
      end

      def measure(desc)
        start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        result = yield
        stop = Process.clock_gettime(Process::CLOCK_MONOTONIC)

        if result
          out.puts "=> #{desc} in #{(stop - start).round(4)}s"
        else
          out.puts "!!! => #{desc.inspect} FAILED"
        end
      end

      def database
        @database ||= Commands::DB::Utils::Database[application]
      end

      def database_config
        database.config
      end
    end
  end
end
