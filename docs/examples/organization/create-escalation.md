```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

organization = Organization.new(client)

result = organization.create_escalation(
    escalation_id: '<ESCALATION_ID>',
    name: '<NAME>',
    steps: [
	    {
	        "delay": 0,
	        "roles": [
	            "owner"
	        ]
	    },
	    {
	        "delay": 900,
	        "roles": [
	            "developer"
	        ],
	        "userIds": [
	            "<USER_ID>"
	        ]
	    }
	],
    repeat: 1 # optional
)
```
