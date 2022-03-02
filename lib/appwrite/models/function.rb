#frozen_string_literal: true

module Appwrite
    module Models
        class Function
            attr_reader :id
            attr_reader :execute
            attr_reader :name
            attr_reader :date_created
            attr_reader :date_updated
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
                execute:,
                name:,
                date_created:,
                date_updated:,
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
                @execute = execute
                @name = name
                @date_created = date_created
                @date_updated = date_updated
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
                    execute: map["execute"],
                    name: map["name"],
                    date_created: map["dateCreated"],
                    date_updated: map["dateUpdated"],
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
                    "execute": @execute,
                    "name": @name,
                    "dateCreated": @date_created,
                    "dateUpdated": @date_updated,
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