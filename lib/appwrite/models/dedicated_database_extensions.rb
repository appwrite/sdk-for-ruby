# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseExtensions
            attr_reader :installed
            attr_reader :available
            attr_reader :metadata

            def initialize(
                installed:,
                available:,
                metadata:
            )
                @installed = installed
                @available = available
                @metadata = metadata
            end

            def self.from(map:)
                DedicatedDatabaseExtensions.new(
                    installed: map["installed"],
                    available: map["available"],
                    metadata: map["metadata"].map { |it| PostgresExtension.from(map: it) }
                )
            end

            def to_map
                {
                    "installed": @installed,
                    "available": @available,
                    "metadata": @metadata.map { |it| it.to_map }
                }
            end
        end
    end
end
