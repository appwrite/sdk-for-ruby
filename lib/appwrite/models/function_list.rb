#frozen_string_literal: true

module Appwrite
    module Models
        class FunctionList
            attr_reader :sum
            attr_reader :functions

            def initialize(
                sum:,
                functions:
            )
                @sum = sum
                @functions = functions
            end

            def self.from(map:)
                FunctionList.new(
                    sum: map["sum"],
                    functions: map["functions"].map { |it| Function.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "functions": @functions.map { |it| it.to_map }
                }
            end
        end
    end
end