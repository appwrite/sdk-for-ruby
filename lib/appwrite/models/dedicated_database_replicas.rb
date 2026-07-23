#frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseReplicas
            attr_reader :replicas
            attr_reader :sync_mode
            attr_reader :members

            def initialize(
                replicas:,
                sync_mode:,
                members:
            )
                @replicas = replicas
                @sync_mode = sync_mode
                @members = members
            end

            def self.from(map:)
                DedicatedDatabaseReplicas.new(
                    replicas: map["replicas"],
                    sync_mode: map["syncMode"],
                    members: map["members"].map { |it| DedicatedDatabaseMember.from(map: it) }
                )
            end

            def to_map
                {
                    "replicas": @replicas,
                    "syncMode": @sync_mode,
                    "members": @members.map { |it| it.to_map }
                }
            end
        end
    end
end
