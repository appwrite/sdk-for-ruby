#frozen_string_literal: true

module Appwrite
    module Models
        class ProjectList
            attr_reader :total
            attr_reader :projects

            def initialize(
                total:,
                projects:
            )
                @total = total
                @projects = projects
            end

            def self.from(map:)
                ProjectList.new(
                    total: map["total"],
                    projects: map["projects"].map { |it| Project.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "projects": @projects.map { |it| it.to_map }
                }
            end
        end
    end
end
