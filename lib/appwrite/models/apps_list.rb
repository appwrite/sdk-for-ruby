#frozen_string_literal: true

module Appwrite
    module Models
        class AppsList
            attr_reader :total
            attr_reader :apps

            def initialize(
                total:,
                apps:
            )
                @total = total
                @apps = apps
            end

            def self.from(map:)
                AppsList.new(
                    total: map["total"],
                    apps: map["apps"].map { |it| App.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "apps": @apps.map { |it| it.to_map }
                }
            end
        end
    end
end
