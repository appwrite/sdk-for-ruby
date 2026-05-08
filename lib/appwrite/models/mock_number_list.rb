#frozen_string_literal: true

module Appwrite
    module Models
        class MockNumberList
            attr_reader :total
            attr_reader :mock_numbers

            def initialize(
                total:,
                mock_numbers:
            )
                @total = total
                @mock_numbers = mock_numbers
            end

            def self.from(map:)
                MockNumberList.new(
                    total: map["total"],
                    mock_numbers: map["mockNumbers"].map { |it| MockNumber.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "mockNumbers": @mock_numbers.map { |it| it.to_map }
                }
            end
        end
    end
end
