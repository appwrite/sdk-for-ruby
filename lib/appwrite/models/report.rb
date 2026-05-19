#frozen_string_literal: true

module Appwrite
    module Models
        class Report
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :app_id
            attr_reader :type
            attr_reader :title
            attr_reader :summary
            attr_reader :target_type
            attr_reader :target
            attr_reader :categories
            attr_reader :insights
            attr_reader :analyzed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                app_id:,
                type:,
                title:,
                summary:,
                target_type:,
                target:,
                categories:,
                insights:,
                analyzed_at: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @app_id = app_id
                @type = type
                @title = title
                @summary = summary
                @target_type = target_type
                @target = target
                @categories = categories
                @insights = insights
                @analyzed_at = analyzed_at
            end

            def self.from(map:)
                Report.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    app_id: map["appId"],
                    type: map["type"],
                    title: map["title"],
                    summary: map["summary"],
                    target_type: map["targetType"],
                    target: map["target"],
                    categories: map["categories"],
                    insights: map["insights"].map { |it| Insight.from(map: it) },
                    analyzed_at: map["analyzedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "appId": @app_id,
                    "type": @type,
                    "title": @title,
                    "summary": @summary,
                    "targetType": @target_type,
                    "target": @target,
                    "categories": @categories,
                    "insights": @insights.map { |it| it.to_map },
                    "analyzedAt": @analyzed_at
                }
            end
        end
    end
end
