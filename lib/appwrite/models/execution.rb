#frozen_string_literal: true

module Appwrite
    module Models
        class Execution
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :read
            attr_reader :function_id
            attr_reader :trigger
            attr_reader :status
            attr_reader :status_code
            attr_reader :response
            attr_reader :stderr
            attr_reader :time

            def initialize(
                id:,
                created_at:,
                updated_at:,
                read:,
                function_id:,
                trigger:,
                status:,
                status_code:,
                response:,
                stderr:,
                time:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @read = read
                @function_id = function_id
                @trigger = trigger
                @status = status
                @status_code = status_code
                @response = response
                @stderr = stderr
                @time = time
            end

            def self.from(map:)
                Execution.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    read: map["$read"],
                    function_id: map["functionId"],
                    trigger: map["trigger"],
                    status: map["status"],
                    status_code: map["statusCode"],
                    response: map["response"],
                    stderr: map["stderr"],
                    time: map["time"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$read": @read,
                    "functionId": @function_id,
                    "trigger": @trigger,
                    "status": @status,
                    "statusCode": @status_code,
                    "response": @response,
                    "stderr": @stderr,
                    "time": @time
                }
            end
        end
    end
end