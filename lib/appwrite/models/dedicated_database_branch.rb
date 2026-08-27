# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseBranch
            attr_reader :branch_id
            attr_reader :branch_name
            attr_reader :namespace
            attr_reader :expires_at
            attr_reader :host
            attr_reader :port
            attr_reader :database
            attr_reader :username
            attr_reader :password
            attr_reader :ssl
            attr_reader :engine
            attr_reader :connection_string

            def initialize(
                branch_id:,
                branch_name:,
                namespace:,
                expires_at:,
                host:,
                port:,
                database:,
                username:,
                password:,
                ssl:,
                engine:,
                connection_string:
            )
                @branch_id = branch_id
                @branch_name = branch_name
                @namespace = namespace
                @expires_at = expires_at
                @host = host
                @port = port
                @database = database
                @username = username
                @password = password
                @ssl = ssl
                @engine = engine
                @connection_string = connection_string
            end

            def self.from(map:)
                DedicatedDatabaseBranch.new(
                    branch_id: map["branchId"],
                    branch_name: map["branchName"],
                    namespace: map["namespace"],
                    expires_at: map["expiresAt"],
                    host: map["host"],
                    port: map["port"],
                    database: map["database"],
                    username: map["username"],
                    password: map["password"],
                    ssl: map["ssl"],
                    engine: map["engine"],
                    connection_string: map["connectionString"]
                )
            end

            def to_map
                {
                    "branchId": @branch_id,
                    "branchName": @branch_name,
                    "namespace": @namespace,
                    "expiresAt": @expires_at,
                    "host": @host,
                    "port": @port,
                    "database": @database,
                    "username": @username,
                    "password": @password,
                    "ssl": @ssl,
                    "engine": @engine,
                    "connectionString": @connection_string
                }
            end
        end
    end
end
