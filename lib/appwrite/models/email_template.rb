#frozen_string_literal: true

module Appwrite
    module Models
        class EmailTemplate
            attr_reader :template_id
            attr_reader :locale
            attr_reader :message
            attr_reader :sender_name
            attr_reader :sender_email
            attr_reader :reply_to_email
            attr_reader :reply_to_name
            attr_reader :subject

            def initialize(
                template_id:,
                locale:,
                message:,
                sender_name:,
                sender_email:,
                reply_to_email:,
                reply_to_name:,
                subject:
            )
                @template_id = template_id
                @locale = locale
                @message = message
                @sender_name = sender_name
                @sender_email = sender_email
                @reply_to_email = reply_to_email
                @reply_to_name = reply_to_name
                @subject = subject
            end

            def self.from(map:)
                EmailTemplate.new(
                    template_id: map["templateId"],
                    locale: map["locale"],
                    message: map["message"],
                    sender_name: map["senderName"],
                    sender_email: map["senderEmail"],
                    reply_to_email: map["replyToEmail"],
                    reply_to_name: map["replyToName"],
                    subject: map["subject"]
                )
            end

            def to_map
                {
                    "templateId": @template_id,
                    "locale": @locale,
                    "message": @message,
                    "senderName": @sender_name,
                    "senderEmail": @sender_email,
                    "replyToEmail": @reply_to_email,
                    "replyToName": @reply_to_name,
                    "subject": @subject
                }
            end
        end
    end
end
