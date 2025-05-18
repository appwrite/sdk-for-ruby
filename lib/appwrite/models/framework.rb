#frozen_string_literal: true

module Appwrite
    module Models
        class Framework
            attr_reader :key
            attr_reader :name
            attr_reader :build_runtime
            attr_reader :runtimes
            attr_reader :adapters

            def initialize(
                key:,
                name:,
                build_runtime:,
                runtimes:,
                adapters:
            )
                @key = key
                @name = name
                @build_runtime = build_runtime
                @runtimes = runtimes
                @adapters = adapters
            end

            def self.from(map:)
                Framework.new(
                    key: map["key"],
                    name: map["name"],
                    build_runtime: map["buildRuntime"],
                    runtimes: map["runtimes"],
                    adapters: map["adapters"].map { |it| FrameworkAdapter.from(map: it) }
                )
            end

            def to_map
                {
                    "key": @key,
                    "name": @name,
                    "buildRuntime": @build_runtime,
                    "runtimes": @runtimes,
                    "adapters": @adapters.map { |it| it.to_map }
                }
            end
        end
    end
end
