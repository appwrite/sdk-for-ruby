#frozen_string_literal: true

module Appwrite
    module Models
        class TemplateRuntime
            attr_reader :name
            attr_reader :commands
            attr_reader :entrypoint
            attr_reader :provider_root_directory

            def initialize(
                name:,
                commands:,
                entrypoint:,
                provider_root_directory:
            )
                @name = name
                @commands = commands
                @entrypoint = entrypoint
                @provider_root_directory = provider_root_directory
            end

            def self.from(map:)
                TemplateRuntime.new(
                    name: map["name"],
                    commands: map["commands"],
                    entrypoint: map["entrypoint"],
                    provider_root_directory: map["providerRootDirectory"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "commands": @commands,
                    "entrypoint": @entrypoint,
                    "providerRootDirectory": @provider_root_directory
                }
            end
        end
    end
end
