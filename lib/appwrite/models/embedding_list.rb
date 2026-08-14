#frozen_string_literal: true

module Appwrite
    module Models
        class EmbeddingList
            attr_reader :total
            attr_reader :embeddings

            def initialize(
                total:,
                embeddings:
            )
                @total = total
                @embeddings = embeddings
            end

            def self.from(map:)
                EmbeddingList.new(
                    total: map["total"],
                    embeddings: map["embeddings"].map { |it| Embedding.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "embeddings": @embeddings.map { |it| it.to_map }
                }
            end
        end
    end
end
