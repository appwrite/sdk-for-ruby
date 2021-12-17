#frozen_string_literal: true

module Appwrite
    module Models
        class LogList
            attr_reader :logs

            def initialize(
                logs:
            )
                @logs = logs
            end

            def self.from(map:)
                LogList.new(
                    logs: map["logs"].map { |it| Log.from(map: it) }
                )
            end

            def to_map
                {
                    "logs": @logs.map { |it| it.to_map }
                }
            end
        end
    end
end