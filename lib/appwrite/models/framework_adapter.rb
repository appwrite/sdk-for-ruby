#frozen_string_literal: true

module Appwrite
    module Models
        class FrameworkAdapter
            attr_reader :key
            attr_reader :install_command
            attr_reader :build_command
            attr_reader :output_directory
            attr_reader :fallback_file

            def initialize(
                key:,
                install_command:,
                build_command:,
                output_directory:,
                fallback_file:
            )
                @key = key
                @install_command = install_command
                @build_command = build_command
                @output_directory = output_directory
                @fallback_file = fallback_file
            end

            def self.from(map:)
                FrameworkAdapter.new(
                    key: map["key"],
                    install_command: map["installCommand"],
                    build_command: map["buildCommand"],
                    output_directory: map["outputDirectory"],
                    fallback_file: map["fallbackFile"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "installCommand": @install_command,
                    "buildCommand": @build_command,
                    "outputDirectory": @output_directory,
                    "fallbackFile": @fallback_file
                }
            end
        end
    end
end
