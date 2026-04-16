#frozen_string_literal: true

module Appwrite
    module Models
        class KeyList
            attr_reader :total
            attr_reader :keys

            def initialize(
                total:,
                keys:
            )
                @total = total
                @keys = keys
            end

            def self.from(map:)
                KeyList.new(
                    total: map["total"],
                    keys: map["keys"].map { |it| Key.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "keys": @keys.map { |it| it.to_map }
                }
            end
        end
    end
end
