require 'mime/types'

module Appwrite
    class InputFile
        attr_accessor :path
        attr_accessor :filename
        attr_accessor :mime_type
        attr_accessor :source_type
        attr_accessor :data

        def self.from_path(path)
            instance = InputFile.new
            instance.path = path
            instance.filename = ::File.basename(path)
            instance.mime_type = MIME::Types.type_for(path).first.content_type
            instance.source_type = 'path'
            instance
        end

        def self.from_string(string, filename: nil, mime_type: nil)
            instance = InputFile.new
            instance.data = string
            instance.filename = filename
            instance.mime_type = mime_type
            instance.source_type = 'string'
            instance
        end

        def self.from_bytes(bytes, filename: nil, mime_type: nil)
            self.from_string(bytes.pack('C*'), filename: filename, mime_type: mime_type)
        end
    end
end