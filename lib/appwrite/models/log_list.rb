#frozen_string_literal: true

module Appwrite
    module Models
        class LogList
            attr_reader :total
            attr_reader :logs

            def initialize(
                total:,
                logs:
            )
                @total = total
                @logs = logs
            end

            def self.from(map:)
                LogList.new(
                    total: map["total"],
                    logs: map["logs"].map { |it| Log.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "logs": @logs.map { |it| it.to_map }
                }
            end
        end
    end
end
