```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.update_ldap(
    enabled: false, # optional
    hosts: ["ldap.example.com"], # optional
    port: 636, # optional
    encryption: ProjectLDAPEncryption::NONE, # optional
    verification: false, # optional
    certificate: '<CERTIFICATE>', # optional
    timeout: 10, # optional
    base_dn: 'ou=people,dc=example,dc=com', # optional
    bind_dn: 'cn=appwrite,ou=services,dc=example,dc=com', # optional
    bind_password: 'password', # optional
    user_filter: '(uid={username})', # optional
    required_group_dn: 'cn=staff,ou=groups,dc=example,dc=com', # optional
    id_attribute: 'entryUUID', # optional
    email_attribute: 'mail', # optional
    name_attribute: 'cn', # optional
    phone_attribute: 'mobile' # optional
)
```
