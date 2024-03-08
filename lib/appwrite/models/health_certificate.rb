#frozen_string_literal: true

module Appwrite
    module Models
        class HealthCertificate
            attr_reader :name
            attr_reader :subject_sn
            attr_reader :issuer_organisation
            attr_reader :valid_from
            attr_reader :valid_to
            attr_reader :signature_type_sn

            def initialize(
                name:,
                subject_sn:,
                issuer_organisation:,
                valid_from:,
                valid_to:,
                signature_type_sn:
            )
                @name = name
                @subject_sn = subject_sn
                @issuer_organisation = issuer_organisation
                @valid_from = valid_from
                @valid_to = valid_to
                @signature_type_sn = signature_type_sn
            end

            def self.from(map:)
                HealthCertificate.new(
                    name: map["name"],
                    subject_sn: map["subjectSN"],
                    issuer_organisation: map["issuerOrganisation"],
                    valid_from: map["validFrom"],
                    valid_to: map["validTo"],
                    signature_type_sn: map["signatureTypeSN"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "subjectSN": @subject_sn,
                    "issuerOrganisation": @issuer_organisation,
                    "validFrom": @valid_from,
                    "validTo": @valid_to,
                    "signatureTypeSN": @signature_type_sn
                }
            end
        end
    end
end
