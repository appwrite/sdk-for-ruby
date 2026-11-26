```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

project = Project.new(client)

result = project.create_video_profile(
    profile_id: '<PROFILE_ID>',
    name: '<NAME>',
    video_bit_rate: 32000,
    audio_bit_rate: 32000,
    width: 16,
    height: 16,
    codec: VideoCodecId::H264 # optional
)
```
