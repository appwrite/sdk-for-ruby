#frozen_string_literal: true

module Appwrite
    module Models
        class Runtime
            attr_reader :id
            attr_reader :name
            attr_reader :version
            attr_reader :base
            attr_reader :image
            attr_reader :logo
            attr_reader :supports

            def initialize(
                id:,
                name:,
                version:,
                base:,
                image:,
                logo:,
                supports:
            )
                @id = id
                @name = name
                @version = version
                @base = base
                @image = image
                @logo = logo
                @supports = supports
            end

            def self.from(map:)
                Runtime.new(
                    id: map["$id"],
                    name: map["name"],
                    version: map["version"],
                    base: map["base"],
                    image: map["image"],
                    logo: map["logo"],
                    supports: map["supports"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "version": @version,
                    "base": @base,
                    "image": @image,
                    "logo": @logo,
                    "supports": @supports
                }
            end
        end
    end
end