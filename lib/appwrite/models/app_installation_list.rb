# frozen_string_literal: true

module Appwrite
    module Models
        class AppInstallationList
            attr_reader :total
            attr_reader :installations

            def initialize(
                total:,
                installations:
            )
                @total = total
                @installations = installations
            end

            def self.from(map:)
                AppInstallationList.new(
                    total: map["total"],
                    installations: map["installations"].map { |it| AppInstallation.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "installations": @installations.map { |it| it.to_map }
                }
            end
        end
    end
end
