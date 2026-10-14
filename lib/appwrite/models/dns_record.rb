# frozen_string_literal: true

module Appwrite
    module Models
        class DnsRecord
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :type
            attr_reader :name
            attr_reader :value
            attr_reader :ttl
            attr_reader :priority
            attr_reader :lock
            attr_reader :weight
            attr_reader :port
            attr_reader :comment

            def initialize(
                id:,
                created_at:,
                updated_at:,
                type:,
                name:,
                value:,
                ttl:,
                priority:,
                lock:,
                weight:,
                port:,
                comment:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @type = type
                @name = name
                @value = value
                @ttl = ttl
                @priority = priority
                @lock = lock
                @weight = weight
                @port = port
                @comment = comment
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "type" => "", "name" => "", "value" => "", "ttl" => 3600, "priority" => 0, "lock" => false, "weight" => 0, "port" => 0, "comment" => "" }.merge(map)
                DnsRecord.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    type: map["type"],
                    name: map["name"],
                    value: map["value"],
                    ttl: map["ttl"],
                    priority: map["priority"],
                    lock: map["lock"],
                    weight: map["weight"],
                    port: map["port"],
                    comment: map["comment"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "type": @type,
                    "name": @name,
                    "value": @value,
                    "ttl": @ttl,
                    "priority": @priority,
                    "lock": @lock,
                    "weight": @weight,
                    "port": @port,
                    "comment": @comment
                }
            end
        end
    end
end
