#frozen_string_literal: true

module Appwrite
    module Models
        class PhoneList
            attr_reader :total
            attr_reader :phones

            def initialize(
                total:,
                phones:
            )
                @total = total
                @phones = phones
            end

            def self.from(map:)
                PhoneList.new(
                    total: map["total"],
                    phones: map["phones"].map { |it| Phone.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "phones": @phones.map { |it| it.to_map }
                }
            end
        end
    end
end