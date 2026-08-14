#frozen_string_literal: true

module Appwrite
    class Embeddings < Service

        def initialize(client)
            @client = client
        end

        # Generate vector embeddings for an array of text using the selected
        # embedding model. Use the returned vectors to power semantic search and
        # similarity queries against your vector collections.
        # 
        #
        # @param [Array] texts Array of text to generate embeddings.
        # @param [EmbeddingModel] model The embedding model to use for generating vector embeddings.
        #
        # @return [EmbeddingList]
        def create_text_embeddings(texts:, model: nil)
            api_path = '/embeddings/text'

            if texts.nil?
              raise Appwrite::Exception.new('Missing required parameter: "texts"')
            end

            api_params = {
                texts: texts,
                model: model,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EmbeddingList
            )

        end

    end 
end
