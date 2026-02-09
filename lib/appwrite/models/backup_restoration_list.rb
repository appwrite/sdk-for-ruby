#frozen_string_literal: true

module Appwrite
    module Models
        class BackupRestorationList
            attr_reader :total
            attr_reader :restorations

            def initialize(
                total:,
                restorations:
            )
                @total = total
                @restorations = restorations
            end

            def self.from(map:)
                BackupRestorationList.new(
                    total: map["total"],
                    restorations: map["restorations"].map { |it| BackupRestoration.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "restorations": @restorations.map { |it| it.to_map }
                }
            end
        end
    end
end
