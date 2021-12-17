#frozen_string_literal: true

module Appwrite
    module Models
        class DocumentList
            attr_reader :sum
            attr_reader :documents

            def initialize(
                sum:,
                documents:
            )
                @sum = sum
                @documents = documents
            end

            def self.from(map:)
                DocumentList.new(
                    sum: map["sum"],
                    documents: map["documents"].map { |it| Document.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "documents": @documents.map { |it| it.to_map }
                }
            end

            def convert_to(from_json)
                documents.map { |it| it.convert_to(from_json) }
            end
        end
    end
end