#frozen_string_literal: true

module Appwrite
    module Models
        class Function
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :execute
            attr_reader :name
            attr_reader :status
            attr_reader :runtime
            attr_reader :deployment
            attr_reader :vars
            attr_reader :events
            attr_reader :schedule
            attr_reader :schedule_next
            attr_reader :schedule_previous
            attr_reader :timeout

            def initialize(
                id:,
                created_at:,
                updated_at:,
                execute:,
                name:,
                status:,
                runtime:,
                deployment:,
                vars:,
                events:,
                schedule:,
                schedule_next:,
                schedule_previous:,
                timeout:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @execute = execute
                @name = name
                @status = status
                @runtime = runtime
                @deployment = deployment
                @vars = vars
                @events = events
                @schedule = schedule
                @schedule_next = schedule_next
                @schedule_previous = schedule_previous
                @timeout = timeout
            end

            def self.from(map:)
                Function.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    execute: map["execute"],
                    name: map["name"],
                    status: map["status"],
                    runtime: map["runtime"],
                    deployment: map["deployment"],
                    vars: map["vars"],
                    events: map["events"],
                    schedule: map["schedule"],
                    schedule_next: map["scheduleNext"],
                    schedule_previous: map["schedulePrevious"],
                    timeout: map["timeout"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "execute": @execute,
                    "name": @name,
                    "status": @status,
                    "runtime": @runtime,
                    "deployment": @deployment,
                    "vars": @vars,
                    "events": @events,
                    "schedule": @schedule,
                    "scheduleNext": @schedule_next,
                    "schedulePrevious": @schedule_previous,
                    "timeout": @timeout
                }
            end
        end
    end
end