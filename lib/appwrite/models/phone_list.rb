#frozen_string_literal: true

module Appwrite
    module Models
        class PhoneList
            attr_reader :sum
            attr_reader :phones

            def initialize(
                sum:,
                phones:
            )
                @sum = sum
                @phones = phones
            end

            def self.from(map:)
                PhoneList.new(
                    sum: map["sum"],
                    phones: map["phones"].map { |it| Phone.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "phones": @phones.map { |it| it.to_map }
                }
            end
        end
    end
end