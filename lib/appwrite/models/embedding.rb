#frozen_string_literal: true

module Appwrite
    module Models
        class Embedding
            attr_reader :model
            attr_reader :dimension
            attr_reader :embedding
            attr_reader :error

            def initialize(
                model:,
                dimension:,
                embedding:,
                error:
            )
                @model = model
                @dimension = dimension
                @embedding = embedding
                @error = error
            end

            def self.from(map:)
                Embedding.new(
                    model: map["model"],
                    dimension: map["dimension"],
                    embedding: map["embedding"],
                    error: map["error"]
                )
            end

            def to_map
                {
                    "model": @model,
                    "dimension": @dimension,
                    "embedding": @embedding,
                    "error": @error
                }
            end
        end
    end
end
