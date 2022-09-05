#frozen_string_literal: true

module Appwrite
    module Models
        class VariableList
            attr_reader :total
            attr_reader :variables

            def initialize(
                total:,
                variables:
            )
                @total = total
                @variables = variables
            end

            def self.from(map:)
                VariableList.new(
                    total: map["total"],
                    variables: map["variables"].map { |it| Variable.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "variables": @variables.map { |it| it.to_map }
                }
            end
        end
    end
end