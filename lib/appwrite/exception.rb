module Appwrite
    class Exception < StandardError
        attr_reader :code
        attr_reader :response
        attr_reader :type
        
        def initialize(message, code = 0, type = nil, response = nil)
            super(message)
            @code = code
            @type = type
            @response = response
        end
    end
end
