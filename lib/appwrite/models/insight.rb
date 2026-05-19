#frozen_string_literal: true

module Appwrite
    module Models
        class Insight
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :report_id
            attr_reader :type
            attr_reader :severity
            attr_reader :status
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :parent_resource_type
            attr_reader :parent_resource_id
            attr_reader :title
            attr_reader :summary
            attr_reader :ctas
            attr_reader :analyzed_at
            attr_reader :dismissed_at
            attr_reader :dismissed_by

            def initialize(
                id:,
                created_at:,
                updated_at:,
                report_id:,
                type:,
                severity:,
                status:,
                resource_type:,
                resource_id:,
                parent_resource_type:,
                parent_resource_id:,
                title:,
                summary:,
                ctas:,
                analyzed_at: ,
                dismissed_at: ,
                dismissed_by: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @report_id = report_id
                @type = type
                @severity = severity
                @status = status
                @resource_type = resource_type
                @resource_id = resource_id
                @parent_resource_type = parent_resource_type
                @parent_resource_id = parent_resource_id
                @title = title
                @summary = summary
                @ctas = ctas
                @analyzed_at = analyzed_at
                @dismissed_at = dismissed_at
                @dismissed_by = dismissed_by
            end

            def self.from(map:)
                Insight.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    report_id: map["reportId"],
                    type: map["type"],
                    severity: map["severity"],
                    status: map["status"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    parent_resource_type: map["parentResourceType"],
                    parent_resource_id: map["parentResourceId"],
                    title: map["title"],
                    summary: map["summary"],
                    ctas: map["ctas"].map { |it| InsightCTA.from(map: it) },
                    analyzed_at: map["analyzedAt"],
                    dismissed_at: map["dismissedAt"],
                    dismissed_by: map["dismissedBy"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "reportId": @report_id,
                    "type": @type,
                    "severity": @severity,
                    "status": @status,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "parentResourceType": @parent_resource_type,
                    "parentResourceId": @parent_resource_id,
                    "title": @title,
                    "summary": @summary,
                    "ctas": @ctas.map { |it| it.to_map },
                    "analyzedAt": @analyzed_at,
                    "dismissedAt": @dismissed_at,
                    "dismissedBy": @dismissed_by
                }
            end
        end
    end
end
