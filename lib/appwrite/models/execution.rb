#frozen_string_literal: true

module Appwrite
    module Models
        class Execution
            attr_reader :id
            attr_reader :read
            attr_reader :function_id
            attr_reader :date_created
            attr_reader :trigger
            attr_reader :status
            attr_reader :exit_code
            attr_reader :stdout
            attr_reader :stderr
            attr_reader :time

            def initialize(
                id:,
                read:,
                function_id:,
                date_created:,
                trigger:,
                status:,
                exit_code:,
                stdout:,
                stderr:,
                time:
            )
                @id = id
                @read = read
                @function_id = function_id
                @date_created = date_created
                @trigger = trigger
                @status = status
                @exit_code = exit_code
                @stdout = stdout
                @stderr = stderr
                @time = time
            end

            def self.from(map:)
                Execution.new(
                    id: map["$id"],
                    read: map["$read"],
                    function_id: map["functionId"],
                    date_created: map["dateCreated"],
                    trigger: map["trigger"],
                    status: map["status"],
                    exit_code: map["exitCode"],
                    stdout: map["stdout"],
                    stderr: map["stderr"],
                    time: map["time"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$read": @read,
                    "functionId": @function_id,
                    "dateCreated": @date_created,
                    "trigger": @trigger,
                    "status": @status,
                    "exitCode": @exit_code,
                    "stdout": @stdout,
                    "stderr": @stderr,
                    "time": @time
                }
            end
        end
    end
end