require 'net/http'
require 'uri'
require 'json'
require 'mime/types'

require_relative 'appwrite/client'
require_relative 'appwrite/service'
require_relative 'appwrite/exception'
require_relative 'appwrite/input_file'
require_relative 'appwrite/query'
require_relative 'appwrite/permission'
require_relative 'appwrite/role'
require_relative 'appwrite/id'

require_relative 'appwrite/models/document_list'
require_relative 'appwrite/models/collection_list'
require_relative 'appwrite/models/database_list'
require_relative 'appwrite/models/index_list'
require_relative 'appwrite/models/user_list'
require_relative 'appwrite/models/session_list'
require_relative 'appwrite/models/identity_list'
require_relative 'appwrite/models/log_list'
require_relative 'appwrite/models/file_list'
require_relative 'appwrite/models/bucket_list'
require_relative 'appwrite/models/team_list'
require_relative 'appwrite/models/membership_list'
require_relative 'appwrite/models/function_list'
require_relative 'appwrite/models/runtime_list'
require_relative 'appwrite/models/deployment_list'
require_relative 'appwrite/models/execution_list'
require_relative 'appwrite/models/country_list'
require_relative 'appwrite/models/continent_list'
require_relative 'appwrite/models/language_list'
require_relative 'appwrite/models/currency_list'
require_relative 'appwrite/models/phone_list'
require_relative 'appwrite/models/variable_list'
require_relative 'appwrite/models/locale_code_list'
require_relative 'appwrite/models/provider_list'
require_relative 'appwrite/models/message_list'
require_relative 'appwrite/models/topic_list'
require_relative 'appwrite/models/subscriber_list'
require_relative 'appwrite/models/target_list'
require_relative 'appwrite/models/specification_list'
require_relative 'appwrite/models/database'
require_relative 'appwrite/models/collection'
require_relative 'appwrite/models/attribute_list'
require_relative 'appwrite/models/attribute_string'
require_relative 'appwrite/models/attribute_integer'
require_relative 'appwrite/models/attribute_float'
require_relative 'appwrite/models/attribute_boolean'
require_relative 'appwrite/models/attribute_email'
require_relative 'appwrite/models/attribute_enum'
require_relative 'appwrite/models/attribute_ip'
require_relative 'appwrite/models/attribute_url'
require_relative 'appwrite/models/attribute_datetime'
require_relative 'appwrite/models/attribute_relationship'
require_relative 'appwrite/models/index'
require_relative 'appwrite/models/document'
require_relative 'appwrite/models/log'
require_relative 'appwrite/models/user'
require_relative 'appwrite/models/algo_md5'
require_relative 'appwrite/models/algo_sha'
require_relative 'appwrite/models/algo_phpass'
require_relative 'appwrite/models/algo_bcrypt'
require_relative 'appwrite/models/algo_scrypt'
require_relative 'appwrite/models/algo_scrypt_modified'
require_relative 'appwrite/models/algo_argon2'
require_relative 'appwrite/models/preferences'
require_relative 'appwrite/models/session'
require_relative 'appwrite/models/identity'
require_relative 'appwrite/models/token'
require_relative 'appwrite/models/jwt'
require_relative 'appwrite/models/locale'
require_relative 'appwrite/models/locale_code'
require_relative 'appwrite/models/file'
require_relative 'appwrite/models/bucket'
require_relative 'appwrite/models/team'
require_relative 'appwrite/models/membership'
require_relative 'appwrite/models/function'
require_relative 'appwrite/models/runtime'
require_relative 'appwrite/models/deployment'
require_relative 'appwrite/models/execution'
require_relative 'appwrite/models/build'
require_relative 'appwrite/models/variable'
require_relative 'appwrite/models/country'
require_relative 'appwrite/models/continent'
require_relative 'appwrite/models/language'
require_relative 'appwrite/models/currency'
require_relative 'appwrite/models/phone'
require_relative 'appwrite/models/health_antivirus'
require_relative 'appwrite/models/health_queue'
require_relative 'appwrite/models/health_status'
require_relative 'appwrite/models/health_certificate'
require_relative 'appwrite/models/health_time'
require_relative 'appwrite/models/headers'
require_relative 'appwrite/models/specification'
require_relative 'appwrite/models/mfa_challenge'
require_relative 'appwrite/models/mfa_recovery_codes'
require_relative 'appwrite/models/mfa_type'
require_relative 'appwrite/models/mfa_factors'
require_relative 'appwrite/models/provider'
require_relative 'appwrite/models/message'
require_relative 'appwrite/models/topic'
require_relative 'appwrite/models/subscriber'
require_relative 'appwrite/models/target'

require_relative 'appwrite/enums/authenticator_type'
require_relative 'appwrite/enums/authentication_factor'
require_relative 'appwrite/enums/o_auth_provider'
require_relative 'appwrite/enums/browser'
require_relative 'appwrite/enums/credit_card'
require_relative 'appwrite/enums/flag'
require_relative 'appwrite/enums/relationship_type'
require_relative 'appwrite/enums/relation_mutate'
require_relative 'appwrite/enums/index_type'
require_relative 'appwrite/enums/runtime'
require_relative 'appwrite/enums/execution_method'
require_relative 'appwrite/enums/name'
require_relative 'appwrite/enums/smtp_encryption'
require_relative 'appwrite/enums/compression'
require_relative 'appwrite/enums/image_gravity'
require_relative 'appwrite/enums/image_format'
require_relative 'appwrite/enums/password_hash'
require_relative 'appwrite/enums/messaging_provider_type'

require_relative 'appwrite/services/account'
require_relative 'appwrite/services/avatars'
require_relative 'appwrite/services/databases'
require_relative 'appwrite/services/functions'
require_relative 'appwrite/services/graphql'
require_relative 'appwrite/services/health'
require_relative 'appwrite/services/locale'
require_relative 'appwrite/services/messaging'
require_relative 'appwrite/services/storage'
require_relative 'appwrite/services/teams'
require_relative 'appwrite/services/users'
