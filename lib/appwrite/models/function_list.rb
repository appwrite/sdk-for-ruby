#frozen_string_literal: true

module Appwrite
    module Models
        class FunctionList
            attr_reader :total
            attr_reader :functions

            def initialize(
                total:,
                functions:
            )
                @total = total
                @functions = functions
            end

            def self.from(map:)
                FunctionList.new(
                    total: map["total"],
                    functions: map["functions"].map { |it| Function.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "functions": @functions.map { |it| it.to_map }
                }
            end
        end
    end
end
