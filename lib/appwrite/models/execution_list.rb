#frozen_string_literal: true

module Appwrite
    module Models
        class ExecutionList
            attr_reader :total
            attr_reader :executions

            def initialize(
                total:,
                executions:
            )
                @total = total
                @executions = executions
            end

            def self.from(map:)
                ExecutionList.new(
                    total: map["total"],
                    executions: map["executions"].map { |it| Execution.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "executions": @executions.map { |it| it.to_map }
                }
            end
        end
    end
end