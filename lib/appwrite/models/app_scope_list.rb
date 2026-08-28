# frozen_string_literal: true

module Appwrite
    module Models
        class AppScopeList
            attr_reader :total
            attr_reader :scopes

            def initialize(
                total:,
                scopes:
            )
                @total = total
                @scopes = scopes
            end

            def self.from(map:)
                AppScopeList.new(
                    total: map["total"],
                    scopes: map["scopes"].map { |it| AppScope.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "scopes": @scopes.map { |it| it.to_map }
                }
            end
        end
    end
end
