#frozen_string_literal: true

module Appwrite
    module Models
        class ExecutionList
            attr_reader :sum
            attr_reader :executions

            def initialize(
                sum:,
                executions:
            )
                @sum = sum
                @executions = executions
            end

            def self.from(map:)
                ExecutionList.new(
                    sum: map["sum"],
                    executions: map["executions"].map { |it| Execution.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "executions": @executions.map { |it| it.to_map }
                }
            end
        end
    end
end