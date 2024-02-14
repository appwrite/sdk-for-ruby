#frozen_string_literal: true

module Appwrite
    module Models
        class DeploymentList
            attr_reader :total
            attr_reader :deployments

            def initialize(
                total:,
                deployments:
            )
                @total = total
                @deployments = deployments
            end

            def self.from(map:)
                DeploymentList.new(
                    total: map["total"],
                    deployments: map["deployments"].map { |it| Deployment.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "deployments": @deployments.map { |it| it.to_map }
                }
            end
        end
    end
end
