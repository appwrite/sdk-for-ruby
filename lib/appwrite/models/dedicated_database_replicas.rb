#frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseReplicas
            attr_reader :replicas
            attr_reader :sync_mode
            attr_reader :effective_sync_mode
            attr_reader :sync_degraded
            attr_reader :sync_acknowledgements
            attr_reader :sync_standby_count
            attr_reader :sync_state_confirmed
            attr_reader :members

            def initialize(
                replicas:,
                sync_mode:,
                effective_sync_mode: ,
                sync_degraded:,
                sync_acknowledgements:,
                sync_standby_count:,
                sync_state_confirmed: ,
                members:
            )
                @replicas = replicas
                @sync_mode = sync_mode
                @effective_sync_mode = effective_sync_mode
                @sync_degraded = sync_degraded
                @sync_acknowledgements = sync_acknowledgements
                @sync_standby_count = sync_standby_count
                @sync_state_confirmed = sync_state_confirmed
                @members = members
            end

            def self.from(map:)
                DedicatedDatabaseReplicas.new(
                    replicas: map["replicas"],
                    sync_mode: map["syncMode"],
                    effective_sync_mode: map["effectiveSyncMode"],
                    sync_degraded: map["syncDegraded"],
                    sync_acknowledgements: map["syncAcknowledgements"],
                    sync_standby_count: map["syncStandbyCount"],
                    sync_state_confirmed: map["syncStateConfirmed"],
                    members: map["members"].map { |it| DedicatedDatabaseMember.from(map: it) }
                )
            end

            def to_map
                {
                    "replicas": @replicas,
                    "syncMode": @sync_mode,
                    "effectiveSyncMode": @effective_sync_mode,
                    "syncDegraded": @sync_degraded,
                    "syncAcknowledgements": @sync_acknowledgements,
                    "syncStandbyCount": @sync_standby_count,
                    "syncStateConfirmed": @sync_state_confirmed,
                    "members": @members.map { |it| it.to_map }
                }
            end
        end
    end
end
