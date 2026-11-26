# frozen_string_literal: true

module Appwrite
    module Models
        class VideoCodec
            attr_reader :id
            attr_reader :name
            attr_reader :outputs

            def initialize(
                id:,
                name:,
                outputs:
            )
                @id = id
                @name = name
                @outputs = validate_outputs(outputs)
            end

            def self.from(map:)
                map = { "$id" => "", "name" => "", "outputs" => [] }.merge(map)
                VideoCodec.new(
                    id: map["$id"],
                    name: map["name"],
                    outputs: map["outputs"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "outputs": @outputs
                }
            end

            private

            def validate_outputs(outputs)
                valid_outputs = [
                    Appwrite::Enums::VideoOutput::HLS,
                    Appwrite::Enums::VideoOutput::DASH,
                    Appwrite::Enums::VideoOutput::CMAF,
                ]

                (outputs || []).each do |value|
                    unless valid_outputs.include?(value)
                        raise ArgumentError, "Invalid " + value.to_s + ". Must be one of: " + valid_outputs.join(', ')
                    end
                end

                outputs
            end
        end
    end
end
