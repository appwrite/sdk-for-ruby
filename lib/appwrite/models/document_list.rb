#frozen_string_literal: true

module Appwrite
    module Models
        class DocumentList
            attr_reader :total
            attr_reader :documents

            def initialize(
                total:,
                documents:
            )
                @total = total
                @documents = documents
            end

            def self.from(map:)
                DocumentList.new(
                    total: map["total"],
                    documents: map["documents"].map { |it| Document.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "documents": @documents.map { |it| it.to_map }
                }
            end

            def convert_to(from_json)
                documents.map { |it| it.convert_to(from_json) }
            end
        end
    end
end