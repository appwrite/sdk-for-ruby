require 'appwrite'

client = Appwrite::Client.new
InputFile = Appwrite::InputFile

client
    .set_endpoint('https://[HOSTNAME_OR_IP]/v1') # Your API Endpoint
    .set_project('5df5acd0d48c2') # Your project ID
    .set_key('919c2d18fb5d4...a2ae413da83346ad2') # Your secret API key

storage = Appwrite::Storage.new(client)

response = storage.create_file(bucket_id: '[BUCKET_ID]', file_id: '[FILE_ID]', file: Appwrite::InputFile.from_path('dir/file.png'))

puts response.inspect