#frozen_string_literal: true

module Appwrite
    module Models
        class ResourceTokenList
            attr_reader :total
            attr_reader :tokens

            def initialize(
                total:,
                tokens:
            )
                @total = total
                @tokens = tokens
            end

            def self.from(map:)
                ResourceTokenList.new(
                    total: map["total"],
                    tokens: map["tokens"].map { |it| ResourceToken.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "tokens": @tokens.map { |it| it.to_map }
                }
            end
        end
    end
end
