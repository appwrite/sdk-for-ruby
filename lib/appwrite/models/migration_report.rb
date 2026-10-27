# frozen_string_literal: true

module Appwrite
    module Models
        class MigrationReport
            attr_reader :user
            attr_reader :team
            attr_reader :database
            attr_reader :row
            attr_reader :file
            attr_reader :bucket
            attr_reader :function
            attr_reader :platform
            attr_reader :api_key
            attr_reader :project_variable
            attr_reader :webhook
            attr_reader :auth_methods
            attr_reader :project_protocols
            attr_reader :project_labels
            attr_reader :project_services
            attr_reader :policies
            attr_reader :smtp
            attr_reader :rule
            attr_reader :project_email_template
            attr_reader :project_environment
            attr_reader :site
            attr_reader :provider
            attr_reader :topic
            attr_reader :subscriber
            attr_reader :message
            attr_reader :size
            attr_reader :version
            attr_reader :oauth2_provider
            attr_reader :backup_policy

            def initialize(
                user:,
                team:,
                database:,
                row:,
                file:,
                bucket:,
                function:,
                platform:,
                api_key:,
                project_variable:,
                webhook:,
                auth_methods:,
                project_protocols:,
                project_labels:,
                project_services:,
                policies:,
                smtp:,
                rule:,
                project_email_template:,
                project_environment:,
                site:,
                provider:,
                topic:,
                subscriber:,
                message:,
                size:,
                version:,
                oauth2_provider:,
                backup_policy:
            )
                @user = user
                @team = team
                @database = database
                @row = row
                @file = file
                @bucket = bucket
                @function = function
                @platform = platform
                @api_key = api_key
                @project_variable = project_variable
                @webhook = webhook
                @auth_methods = auth_methods
                @project_protocols = project_protocols
                @project_labels = project_labels
                @project_services = project_services
                @policies = policies
                @smtp = smtp
                @rule = rule
                @project_email_template = project_email_template
                @project_environment = project_environment
                @site = site
                @provider = provider
                @topic = topic
                @subscriber = subscriber
                @message = message
                @size = size
                @version = version
                @oauth2_provider = oauth2_provider
                @backup_policy = backup_policy
            end

            def self.from(map:)
                map = { "user" => 0, "team" => 0, "database" => 0, "row" => 0, "file" => 0, "bucket" => 0, "function" => 0, "platform" => 0, "api-key" => 0, "project-variable" => 0, "webhook" => 0, "auth-methods" => 0, "project-protocols" => 0, "project-labels" => 0, "project-services" => 0, "policies" => 0, "smtp" => 0, "rule" => 0, "project-email-template" => 0, "project-environment" => 0, "site" => 0, "provider" => 0, "topic" => 0, "subscriber" => 0, "message" => 0, "size" => 0, "version" => "", "oauth2-provider" => 0, "backup-policy" => 0 }.merge(map)
                MigrationReport.new(
                    user: map["user"],
                    team: map["team"],
                    database: map["database"],
                    row: map["row"],
                    file: map["file"],
                    bucket: map["bucket"],
                    function: map["function"],
                    platform: map["platform"],
                    api_key: map["api-key"],
                    project_variable: map["project-variable"],
                    webhook: map["webhook"],
                    auth_methods: map["auth-methods"],
                    project_protocols: map["project-protocols"],
                    project_labels: map["project-labels"],
                    project_services: map["project-services"],
                    policies: map["policies"],
                    smtp: map["smtp"],
                    rule: map["rule"],
                    project_email_template: map["project-email-template"],
                    project_environment: map["project-environment"],
                    site: map["site"],
                    provider: map["provider"],
                    topic: map["topic"],
                    subscriber: map["subscriber"],
                    message: map["message"],
                    size: map["size"],
                    version: map["version"],
                    oauth2_provider: map["oauth2-provider"],
                    backup_policy: map["backup-policy"]
                )
            end

            def to_map
                {
                    "user": @user,
                    "team": @team,
                    "database": @database,
                    "row": @row,
                    "file": @file,
                    "bucket": @bucket,
                    "function": @function,
                    "platform": @platform,
                    "api-key": @api_key,
                    "project-variable": @project_variable,
                    "webhook": @webhook,
                    "auth-methods": @auth_methods,
                    "project-protocols": @project_protocols,
                    "project-labels": @project_labels,
                    "project-services": @project_services,
                    "policies": @policies,
                    "smtp": @smtp,
                    "rule": @rule,
                    "project-email-template": @project_email_template,
                    "project-environment": @project_environment,
                    "site": @site,
                    "provider": @provider,
                    "topic": @topic,
                    "subscriber": @subscriber,
                    "message": @message,
                    "size": @size,
                    "version": @version,
                    "oauth2-provider": @oauth2_provider,
                    "backup-policy": @backup_policy
                }
            end
        end
    end
end
