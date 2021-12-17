require 'mime/types'

module Appwrite
    class File
        attr_reader :name
        attr_reader :content
        attr_reader :mime_type

        def initialize(path)
            @name = ::File.basename(path)
            @content = ::File.read(path)
            @mime_type = MIME::Types.type_for(path)
        end
    end
end