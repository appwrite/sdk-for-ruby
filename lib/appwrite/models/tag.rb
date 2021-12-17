#frozen_string_literal: true

module Appwrite
    module Models
        class Tag
            attr_reader :id
            attr_reader :function_id
            attr_reader :date_created
            attr_reader :command
            attr_reader :size

            def initialize(
                id:,
                function_id:,
                date_created:,
                command:,
                size:
            )
                @id = id
                @function_id = function_id
                @date_created = date_created
                @command = command
                @size = size
            end

            def self.from(map:)
                Tag.new(
                    id: map["$id"],
                    function_id: map["functionId"],
                    date_created: map["dateCreated"],
                    command: map["command"],
                    size: map["size"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "functionId": @function_id,
                    "dateCreated": @date_created,
                    "command": @command,
                    "size": @size
                }
            end
        end
    end
end