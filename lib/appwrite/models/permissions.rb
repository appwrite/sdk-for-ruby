#frozen_string_literal: true

module Appwrite
    module Models
        class Permissions
            attr_reader :read
            attr_reader :write

            def initialize(
                read:,
                write:
            )
                @read = read
                @write = write
            end

            def self.from(map:)
                Permissions.new(
                    read: map["read"],
                    write: map["write"]
                )
            end

            def to_map
                {
                    "read": @read,
                    "write": @write
                }
            end
        end
    end
end