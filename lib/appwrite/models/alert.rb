# frozen_string_literal: true

module Appwrite
    module Models
        class Alert
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :monitor_id
            attr_reader :project_id
            attr_reader :name
            attr_reader :status
            attr_reader :resolved_at
            attr_reader :acknowledged_at
            attr_reader :acknowledged_by
            attr_reader :acknowledged_by_name
            attr_reader :escalation_id
            attr_reader :escalation_step
            attr_reader :escalation_round
            attr_reader :escalates_at
            attr_reader :rules
            attr_reader :severity
            attr_reader :metric
            attr_reader :comparator
            attr_reader :threshold
            attr_reader :value
            attr_reader :peak
            attr_reader :type
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :notifications
            attr_reader :latency
            attr_reader :result

            def initialize(
                id:,
                created_at:,
                updated_at:,
                monitor_id:,
                project_id:,
                name:,
                status:,
                resolved_at: nil,
                acknowledged_at: nil,
                acknowledged_by:,
                acknowledged_by_name:,
                escalation_id:,
                escalation_step:,
                escalation_round:,
                escalates_at: nil,
                rules:,
                severity:,
                metric: nil,
                comparator: nil,
                threshold:,
                value:,
                peak:,
                type:,
                resource_type:,
                resource_id:,
                notifications:,
                latency: nil,
                result: nil
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @monitor_id = monitor_id
                @project_id = project_id
                @name = name
                @status = validate_status(status)
                @resolved_at = resolved_at
                @acknowledged_at = acknowledged_at
                @acknowledged_by = acknowledged_by
                @acknowledged_by_name = acknowledged_by_name
                @escalation_id = escalation_id
                @escalation_step = escalation_step
                @escalation_round = escalation_round
                @escalates_at = escalates_at
                @rules = rules
                @severity = validate_severity(severity)
                @metric = metric.nil? ? metric : validate_metric(metric)
                @comparator = comparator.nil? ? comparator : validate_comparator(comparator)
                @threshold = threshold
                @value = value
                @peak = peak
                @type = validate_type(type)
                @resource_type = validate_resource_type(resource_type)
                @resource_id = resource_id
                @notifications = notifications
                @latency = latency
                @result = result.nil? ? result : validate_result(result)
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "monitorId" => "", "projectId" => "", "name" => "", "status" => "firing", "acknowledgedBy" => "", "acknowledgedByName" => "", "escalationId" => "", "escalationStep" => 0, "escalationRound" => 0, "rules" => [], "severity" => "warning", "threshold" => 0, "value" => 0, "peak" => 0, "type" => "usage", "resourceType" => "project", "resourceId" => "", "notifications" => 0 }.merge(map)
                Alert.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    monitor_id: map["monitorId"],
                    project_id: map["projectId"],
                    name: map["name"],
                    status: map["status"],
                    resolved_at: map["resolvedAt"],
                    acknowledged_at: map["acknowledgedAt"],
                    acknowledged_by: map["acknowledgedBy"],
                    acknowledged_by_name: map["acknowledgedByName"],
                    escalation_id: map["escalationId"],
                    escalation_step: map["escalationStep"],
                    escalation_round: map["escalationRound"],
                    escalates_at: map["escalatesAt"],
                    rules: map["rules"],
                    severity: map["severity"],
                    metric: map["metric"],
                    comparator: map["comparator"],
                    threshold: map["threshold"],
                    value: map["value"],
                    peak: map["peak"],
                    type: map["type"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    notifications: map["notifications"],
                    latency: map["latency"],
                    result: map["result"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "monitorId": @monitor_id,
                    "projectId": @project_id,
                    "name": @name,
                    "status": @status,
                    "resolvedAt": @resolved_at,
                    "acknowledgedAt": @acknowledged_at,
                    "acknowledgedBy": @acknowledged_by,
                    "acknowledgedByName": @acknowledged_by_name,
                    "escalationId": @escalation_id,
                    "escalationStep": @escalation_step,
                    "escalationRound": @escalation_round,
                    "escalatesAt": @escalates_at,
                    "rules": @rules,
                    "severity": @severity,
                    "metric": @metric,
                    "comparator": @comparator,
                    "threshold": @threshold,
                    "value": @value,
                    "peak": @peak,
                    "type": @type,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "notifications": @notifications,
                    "latency": @latency,
                    "result": @result
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::AlertStatus::FIRING,
                    Appwrite::Enums::AlertStatus::RESOLVED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

            def validate_severity(severity)
                valid_severity = [
                    Appwrite::Enums::MonitorSeverity::INFO,
                    Appwrite::Enums::MonitorSeverity::WARNING,
                    Appwrite::Enums::MonitorSeverity::ERROR,
                    Appwrite::Enums::MonitorSeverity::CRITICAL,
                ]

                unless valid_severity.include?(severity)
                    raise ArgumentError, "Invalid " + severity + ". Must be one of: " + valid_severity.join(', ')
                end

                severity
            end

            def validate_metric(metric)
                valid_metric = [
                    Appwrite::Enums::AlertMetric::NETWORK_REQUESTS,
                    Appwrite::Enums::AlertMetric::NETWORK_INBOUND,
                    Appwrite::Enums::AlertMetric::NETWORK_OUTBOUND,
                    Appwrite::Enums::AlertMetric::EXECUTIONS,
                    Appwrite::Enums::AlertMetric::EXECUTIONS_MBSECONDS,
                    Appwrite::Enums::AlertMetric::REALTIME_CONNECTIONS,
                    Appwrite::Enums::AlertMetric::WEBHOOKS_EVENTS_SENT,
                    Appwrite::Enums::AlertMetric::WEBHOOKS_EVENTS_FAILED,
                    Appwrite::Enums::AlertMetric::USERS_MAU,
                    Appwrite::Enums::AlertMetric::AUTH_METHOD_PHONE,
                    Appwrite::Enums::AlertMetric::USERS,
                    Appwrite::Enums::AlertMetric::DATABASES_OPERATIONS_READS,
                    Appwrite::Enums::AlertMetric::DATABASES_OPERATIONS_WRITES,
                    Appwrite::Enums::AlertMetric::DATABASES_STORAGE,
                    Appwrite::Enums::AlertMetric::STORAGE,
                    Appwrite::Enums::AlertMetric::FILES_STORAGE,
                    Appwrite::Enums::AlertMetric::MESSAGES_SENT,
                    Appwrite::Enums::AlertMetric::MESSAGES_SMS_SENT,
                    Appwrite::Enums::AlertMetric::MESSAGES_FAILED,
                    Appwrite::Enums::AlertMetric::AVATARS_SCREENSHOTSGENERATED,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_CPU,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_MEMORY,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_STORAGE,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_CONNECTIONS,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_QPS,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_IOPSREAD,
                    Appwrite::Enums::AlertMetric::DEDICATEDDATABASES_IOPSWRITE,
                    Appwrite::Enums::AlertMetric::ANALYTICS_EVENTS,
                    Appwrite::Enums::AlertMetric::ANALYTICS_PAGEVIEWS,
                    Appwrite::Enums::AlertMetric::BILLING_BUDGETUSED,
                ]

                unless valid_metric.include?(metric)
                    raise ArgumentError, "Invalid " + metric + ". Must be one of: " + valid_metric.join(', ')
                end

                metric
            end

            def validate_comparator(comparator)
                valid_comparator = [
                    Appwrite::Enums::AlertComparator::GREATERTHAN,
                    Appwrite::Enums::AlertComparator::GREATERTHANEQUAL,
                    Appwrite::Enums::AlertComparator::LESSTHAN,
                    Appwrite::Enums::AlertComparator::LESSTHANEQUAL,
                ]

                unless valid_comparator.include?(comparator)
                    raise ArgumentError, "Invalid " + comparator + ". Must be one of: " + valid_comparator.join(', ')
                end

                comparator
            end

            def validate_type(type)
                valid_type = [
                    Appwrite::Enums::MonitorType::USAGE,
                    Appwrite::Enums::MonitorType::HTTP,
                    Appwrite::Enums::MonitorType::DNS,
                    Appwrite::Enums::MonitorType::TCP,
                    Appwrite::Enums::MonitorType::SMTP,
                    Appwrite::Enums::MonitorType::BUDGET,
                ]

                unless valid_type.include?(type)
                    raise ArgumentError, "Invalid " + type + ". Must be one of: " + valid_type.join(', ')
                end

                type
            end

            def validate_resource_type(resource_type)
                valid_resource_type = [
                    Appwrite::Enums::MonitorResourceType::PROJECT,
                    Appwrite::Enums::MonitorResourceType::DATABASE,
                    Appwrite::Enums::MonitorResourceType::BUCKET,
                    Appwrite::Enums::MonitorResourceType::FUNCTION,
                    Appwrite::Enums::MonitorResourceType::SITE,
                    Appwrite::Enums::MonitorResourceType::DEDICATEDDATABASE,
                    Appwrite::Enums::MonitorResourceType::ORGANIZATION,
                ]

                unless valid_resource_type.include?(resource_type)
                    raise ArgumentError, "Invalid " + resource_type + ". Must be one of: " + valid_resource_type.join(', ')
                end

                resource_type
            end

            def validate_result(result)
                valid_result = [
                    Appwrite::Enums::MonitorResult::OK,
                    Appwrite::Enums::MonitorResult::DNS_FAILED,
                    Appwrite::Enums::MonitorResult::CONNECT_REFUSED,
                    Appwrite::Enums::MonitorResult::CONNECT_TIMEOUT,
                    Appwrite::Enums::MonitorResult::CONNECT_FAILED,
                    Appwrite::Enums::MonitorResult::TLS_FAILED,
                    Appwrite::Enums::MonitorResult::TLS_EXPIRING,
                    Appwrite::Enums::MonitorResult::STATUS_MISMATCH,
                    Appwrite::Enums::MonitorResult::ANSWER_MISMATCH,
                    Appwrite::Enums::MonitorResult::SMTP_REJECTED,
                    Appwrite::Enums::MonitorResult::TARGET_DENIED,
                    Appwrite::Enums::MonitorResult::TIMEOUT,
                    Appwrite::Enums::MonitorResult::RULE_MATCHED,
                ]

                unless valid_result.include?(result)
                    raise ArgumentError, "Invalid " + result + ". Must be one of: " + valid_result.join(', ')
                end

                result
            end
        end
    end
end
