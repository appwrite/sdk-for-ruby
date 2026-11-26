# frozen_string_literal: true

module Appwrite
    module Models
        class Monitor
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :project_id
            attr_reader :rules
            attr_reader :type
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :window
            attr_reader :cooldown
            attr_reader :enabled
            attr_reader :notify
            attr_reader :escalation_id
            attr_reader :severity
            attr_reader :status
            attr_reader :value
            attr_reader :evaluated_at
            attr_reader :alert_id
            attr_reader :triggered_at
            attr_reader :interval
            attr_reader :timeout
            attr_reader :url
            attr_reader :method
            attr_reader :headers
            attr_reader :body
            attr_reader :domain
            attr_reader :record
            attr_reader :resolver
            attr_reader :host
            attr_reader :port
            attr_reader :tls_mode
            attr_reader :result
            attr_reader :latency
            attr_reader :code
            attr_reader :certificate_expires_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                project_id:,
                rules:,
                type:,
                resource_type:,
                resource_id:,
                window:,
                cooldown:,
                enabled:,
                notify:,
                escalation_id:,
                severity:,
                status:,
                value: nil,
                evaluated_at: nil,
                alert_id:,
                triggered_at: nil,
                interval:,
                timeout:,
                url:,
                method: nil,
                headers: {},
                body:,
                domain:,
                record: nil,
                resolver:,
                host:,
                port:,
                tls_mode: nil,
                result: nil,
                latency: nil,
                code: nil,
                certificate_expires_at: nil
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @project_id = project_id
                @rules = rules
                @type = validate_type(type)
                @resource_type = validate_resource_type(resource_type)
                @resource_id = resource_id
                @window = window
                @cooldown = cooldown
                @enabled = enabled
                @notify = notify
                @escalation_id = escalation_id
                @severity = validate_severity(severity)
                @status = validate_status(status)
                @value = value
                @evaluated_at = evaluated_at
                @alert_id = alert_id
                @triggered_at = triggered_at
                @interval = interval
                @timeout = timeout
                @url = url
                @method = method.nil? ? method : validate_method(method)
                @headers = headers
                @body = body
                @domain = domain
                @record = record.nil? ? record : validate_record(record)
                @resolver = resolver
                @host = host
                @port = port
                @tls_mode = tls_mode.nil? ? tls_mode : validate_tls_mode(tls_mode)
                @result = result.nil? ? result : validate_result(result)
                @latency = latency
                @code = code
                @certificate_expires_at = certificate_expires_at
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "projectId" => "", "rules" => [], "type" => "usage", "resourceType" => "project", "resourceId" => "", "window" => 3600, "cooldown" => 3600, "enabled" => true, "notify" => ["owner"], "escalationId" => "", "severity" => "warning", "status" => "ok", "alertId" => "", "interval" => 0, "timeout" => 0, "url" => "", "body" => "", "domain" => "", "resolver" => "", "host" => "", "port" => 0 }.merge(map)
                Monitor.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    project_id: map["projectId"],
                    rules: map["rules"],
                    type: map["type"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    window: map["window"],
                    cooldown: map["cooldown"],
                    enabled: map["enabled"],
                    notify: map["notify"],
                    escalation_id: map["escalationId"],
                    severity: map["severity"],
                    status: map["status"],
                    value: map["value"],
                    evaluated_at: map["evaluatedAt"],
                    alert_id: map["alertId"],
                    triggered_at: map["triggeredAt"],
                    interval: map["interval"],
                    timeout: map["timeout"],
                    url: map["url"],
                    method: map["method"],
                    headers: map["headers"],
                    body: map["body"],
                    domain: map["domain"],
                    record: map["record"],
                    resolver: map["resolver"],
                    host: map["host"],
                    port: map["port"],
                    tls_mode: map["tlsMode"],
                    result: map["result"],
                    latency: map["latency"],
                    code: map["code"],
                    certificate_expires_at: map["certificateExpiresAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "projectId": @project_id,
                    "rules": @rules,
                    "type": @type,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "window": @window,
                    "cooldown": @cooldown,
                    "enabled": @enabled,
                    "notify": @notify,
                    "escalationId": @escalation_id,
                    "severity": @severity,
                    "status": @status,
                    "value": @value,
                    "evaluatedAt": @evaluated_at,
                    "alertId": @alert_id,
                    "triggeredAt": @triggered_at,
                    "interval": @interval,
                    "timeout": @timeout,
                    "url": @url,
                    "method": @method,
                    "headers": @headers,
                    "body": @body,
                    "domain": @domain,
                    "record": @record,
                    "resolver": @resolver,
                    "host": @host,
                    "port": @port,
                    "tlsMode": @tls_mode,
                    "result": @result,
                    "latency": @latency,
                    "code": @code,
                    "certificateExpiresAt": @certificate_expires_at
                }
            end

            private

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

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::MonitorStatus::OK,
                    Appwrite::Enums::MonitorStatus::FIRING,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

            def validate_method(method)
                valid_method = [
                    Appwrite::Enums::MonitorMethod::GET,
                    Appwrite::Enums::MonitorMethod::HEAD,
                    Appwrite::Enums::MonitorMethod::POST,
                    Appwrite::Enums::MonitorMethod::PUT,
                    Appwrite::Enums::MonitorMethod::PATCH,
                    Appwrite::Enums::MonitorMethod::DELETE,
                    Appwrite::Enums::MonitorMethod::OPTIONS,
                ]

                unless valid_method.include?(method)
                    raise ArgumentError, "Invalid " + method + ". Must be one of: " + valid_method.join(', ')
                end

                method
            end

            def validate_record(record)
                valid_record = [
                    Appwrite::Enums::MonitorRecord::A,
                    Appwrite::Enums::MonitorRecord::AAAA,
                    Appwrite::Enums::MonitorRecord::CNAME,
                    Appwrite::Enums::MonitorRecord::MX,
                    Appwrite::Enums::MonitorRecord::TXT,
                    Appwrite::Enums::MonitorRecord::NS,
                ]

                unless valid_record.include?(record)
                    raise ArgumentError, "Invalid " + record + ". Must be one of: " + valid_record.join(', ')
                end

                record
            end

            def validate_tls_mode(tls_mode)
                valid_tls_mode = [
                    Appwrite::Enums::MonitorTlsMode::NONE,
                    Appwrite::Enums::MonitorTlsMode::STARTTLS,
                    Appwrite::Enums::MonitorTlsMode::IMPLICIT,
                    Appwrite::Enums::MonitorTlsMode::AUTO,
                ]

                unless valid_tls_mode.include?(tls_mode)
                    raise ArgumentError, "Invalid " + tls_mode + ". Must be one of: " + valid_tls_mode.join(', ')
                end

                tls_mode
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
