#frozen_string_literal: true

module Appwrite
    module Models
        class TagList
            attr_reader :sum
            attr_reader :tags

            def initialize(
                sum:,
                tags:
            )
                @sum = sum
                @tags = tags
            end

            def self.from(map:)
                TagList.new(
                    sum: map["sum"],
                    tags: map["tags"].map { |it| Tag.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "tags": @tags.map { |it| it.to_map }
                }
            end
        end
    end
end