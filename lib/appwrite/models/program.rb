#frozen_string_literal: true

module Appwrite
    module Models
        class Program
            attr_reader :id
            attr_reader :title
            attr_reader :description
            attr_reader :tag
            attr_reader :icon
            attr_reader :url
            attr_reader :active
            attr_reader :external
            attr_reader :billing_plan_id

            def initialize(
                id:,
                title:,
                description:,
                tag:,
                icon:,
                url:,
                active:,
                external:,
                billing_plan_id:
            )
                @id = id
                @title = title
                @description = description
                @tag = tag
                @icon = icon
                @url = url
                @active = active
                @external = external
                @billing_plan_id = billing_plan_id
            end

            def self.from(map:)
                Program.new(
                    id: map["$id"],
                    title: map["title"],
                    description: map["description"],
                    tag: map["tag"],
                    icon: map["icon"],
                    url: map["url"],
                    active: map["active"],
                    external: map["external"],
                    billing_plan_id: map["billingPlanId"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "title": @title,
                    "description": @description,
                    "tag": @tag,
                    "icon": @icon,
                    "url": @url,
                    "active": @active,
                    "external": @external,
                    "billingPlanId": @billing_plan_id
                }
            end
        end
    end
end
