require 'securerandom'

module Appwrite
    class ID
        def self.custom(id)
            id
        end

        # Generate a unique ID with padding to have a longer ID
        def self.unique(padding=7)
            base_id = self.hex_timestamp
            random_padding = SecureRandom.hex(padding)
            random_padding = random_padding[0...padding]
            base_id + random_padding
        end

        #Generate an hex ID based on timestamp
        #Recreated from https://www.php.net/manual/en/function.uniqid.php
        private_class_method def self.hex_timestamp
            now = Time.now
            sec = now.to_i
            usec = now.usec
            hex_timestamp = "%08x%05x" % [sec, usec]
            hex_timestamp
        end
    end
end
