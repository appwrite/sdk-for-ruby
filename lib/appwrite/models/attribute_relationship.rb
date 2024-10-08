#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeRelationship
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :related_collection
            attr_reader :relation_type
            attr_reader :two_way
            attr_reader :two_way_key
            attr_reader :on_delete
            attr_reader :side

            def initialize(
                key:,
                type:,
                status:,
                error:,
                required:,
                array: ,
                created_at:,
                updated_at:,
                related_collection:,
                relation_type:,
                two_way:,
                two_way_key:,
                on_delete:,
                side:
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @required = required
                @array = array
                @created_at = created_at
                @updated_at = updated_at
                @related_collection = related_collection
                @relation_type = relation_type
                @two_way = two_way
                @two_way_key = two_way_key
                @on_delete = on_delete
                @side = side
            end

            def self.from(map:)
                AttributeRelationship.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    related_collection: map["relatedCollection"],
                    relation_type: map["relationType"],
                    two_way: map["twoWay"],
                    two_way_key: map["twoWayKey"],
                    on_delete: map["onDelete"],
                    side: map["side"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "type": @type,
                    "status": @status,
                    "error": @error,
                    "required": @required,
                    "array": @array,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "relatedCollection": @related_collection,
                    "relationType": @relation_type,
                    "twoWay": @two_way,
                    "twoWayKey": @two_way_key,
                    "onDelete": @on_delete,
                    "side": @side
                }
            end
        end
    end
end
