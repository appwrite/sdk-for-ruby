#frozen_string_literal: true

module Appwrite
    module Models
        class LanguageList
            attr_reader :sum
            attr_reader :languages

            def initialize(
                sum:,
                languages:
            )
                @sum = sum
                @languages = languages
            end

            def self.from(map:)
                LanguageList.new(
                    sum: map["sum"],
                    languages: map["languages"].map { |it| Language.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "languages": @languages.map { |it| it.to_map }
                }
            end
        end
    end
end