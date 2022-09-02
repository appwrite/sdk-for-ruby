module Appwrite
    class ID
        def self.custom(id)
            id
        end
        
        def self.unique
            'unique()'
        end
    end
end