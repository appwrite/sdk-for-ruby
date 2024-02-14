#frozen_string_literal: true

module Appwrite
    module Models
        class LanguageList
            attr_reader :total
            attr_reader :languages

            def initialize(
                total:,
                languages:
            )
                @total = total
                @languages = languages
            end

            def self.from(map:)
                LanguageList.new(
                    total: map["total"],
                    languages: map["languages"].map { |it| Language.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "languages": @languages.map { |it| it.to_map }
                }
            end
        end
    end
end
