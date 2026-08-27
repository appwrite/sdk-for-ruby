# frozen_string_literal: true

module Appwrite
    module Models
        class AppSecretList
            attr_reader :total
            attr_reader :secrets

            def initialize(
                total:,
                secrets:
            )
                @total = total
                @secrets = secrets
            end

            def self.from(map:)
                AppSecretList.new(
                    total: map["total"],
                    secrets: map["secrets"].map { |it| AppSecret.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "secrets": @secrets.map { |it| it.to_map }
                }
            end
        end
    end
end
