```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

users = Users.new(client)

result = users.create_scrypt_user(
    user_id: '<USER_ID>',
    email: 'email@example.com',
    password: 'password',
    password_salt: '<PASSWORD_SALT>',
    password_cpu: 8,
    password_memory: 65536,
    password_parallel: 1,
    password_length: 64,
    name: '<NAME>' # optional
)
```
