#frozen_string_literal: true

module Appwrite
    module Models
        class ReportList
            attr_reader :total
            attr_reader :reports

            def initialize(
                total:,
                reports:
            )
                @total = total
                @reports = reports
            end

            def self.from(map:)
                ReportList.new(
                    total: map["total"],
                    reports: map["reports"].map { |it| Report.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "reports": @reports.map { |it| it.to_map }
                }
            end
        end
    end
end
