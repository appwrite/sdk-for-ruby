#frozen_string_literal: true

module Appwrite
    module Models
        class LocaleCodeList
            attr_reader :total
            attr_reader :locale_codes

            def initialize(
                total:,
                locale_codes:
            )
                @total = total
                @locale_codes = locale_codes
            end

            def self.from(map:)
                LocaleCodeList.new(
                    total: map["total"],
                    locale_codes: map["localeCodes"].map { |it| LocaleCode.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "localeCodes": @locale_codes.map { |it| it.to_map }
                }
            end
        end
    end
end
