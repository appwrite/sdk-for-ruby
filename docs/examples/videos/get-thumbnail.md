```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

videos = Videos.new(client)

result = videos.get_thumbnail(
    video_id: '<VIDEO_ID>',
    thumbnail_id: '<THUMBNAIL_ID>',
    width: 0, # optional
    height: 0, # optional
    output: ImageFormat::JPG # optional
)
```
