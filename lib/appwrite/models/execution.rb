#frozen_string_literal: true

module Appwrite
    module Models
        class Execution
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :function_id
            attr_reader :deployment_id
            attr_reader :trigger
            attr_reader :status
            attr_reader :request_method
            attr_reader :request_path
            attr_reader :request_headers
            attr_reader :response_status_code
            attr_reader :response_body
            attr_reader :response_headers
            attr_reader :logs
            attr_reader :errors
            attr_reader :duration
            attr_reader :scheduled_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                function_id:,
                deployment_id:,
                trigger:,
                status:,
                request_method:,
                request_path:,
                request_headers:,
                response_status_code:,
                response_body:,
                response_headers:,
                logs:,
                errors:,
                duration:,
                scheduled_at: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @function_id = function_id
                @deployment_id = deployment_id
                @trigger = validate_trigger(trigger)
                @status = validate_status(status)
                @request_method = request_method
                @request_path = request_path
                @request_headers = request_headers
                @response_status_code = response_status_code
                @response_body = response_body
                @response_headers = response_headers
                @logs = logs
                @errors = errors
                @duration = duration
                @scheduled_at = scheduled_at
            end

            def self.from(map:)
                Execution.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    function_id: map["functionId"],
                    deployment_id: map["deploymentId"],
                    trigger: map["trigger"],
                    status: map["status"],
                    request_method: map["requestMethod"],
                    request_path: map["requestPath"],
                    request_headers: map["requestHeaders"].map { |it| Headers.from(map: it) },
                    response_status_code: map["responseStatusCode"],
                    response_body: map["responseBody"],
                    response_headers: map["responseHeaders"].map { |it| Headers.from(map: it) },
                    logs: map["logs"],
                    errors: map["errors"],
                    duration: map["duration"],
                    scheduled_at: map["scheduledAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "functionId": @function_id,
                    "deploymentId": @deployment_id,
                    "trigger": @trigger,
                    "status": @status,
                    "requestMethod": @request_method,
                    "requestPath": @request_path,
                    "requestHeaders": @request_headers.map { |it| it.to_map },
                    "responseStatusCode": @response_status_code,
                    "responseBody": @response_body,
                    "responseHeaders": @response_headers.map { |it| it.to_map },
                    "logs": @logs,
                    "errors": @errors,
                    "duration": @duration,
                    "scheduledAt": @scheduled_at
                }
            end

            private

            def validate_trigger(trigger)
                valid_trigger = [
                    Appwrite::Enums::ExecutionTrigger::HTTP,
                    Appwrite::Enums::ExecutionTrigger::SCHEDULE,
                    Appwrite::Enums::ExecutionTrigger::EVENT,
                ]

                unless valid_trigger.include?(trigger)
                    raise ArgumentError, "Invalid " + trigger + ". Must be one of: " + valid_trigger.join(', ')
                end

                trigger
            end

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::ExecutionStatus::WAITING,
                    Appwrite::Enums::ExecutionStatus::PROCESSING,
                    Appwrite::Enums::ExecutionStatus::COMPLETED,
                    Appwrite::Enums::ExecutionStatus::FAILED,
                    Appwrite::Enums::ExecutionStatus::SCHEDULED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
