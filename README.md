# Appwrite Ruby SDK

![License](https://img.shields.io/github/license/appwrite/sdk-for-ruby.svg?style=flat-square)
![Version](https://img.shields.io/badge/api%20version-1.5.0-blue.svg?style=flat-square)
[![Build Status](https://img.shields.io/travis/com/appwrite/sdk-generator?style=flat-square)](https://travis-ci.com/appwrite/sdk-generator)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)

**This SDK is compatible with Appwrite server version 1.5.x. For older versions, please check [previous releases](https://github.com/appwrite/sdk-for-ruby/releases).**

Appwrite is an open-source backend as a service server that abstract and simplify complex and repetitive development tasks behind a very simple to use REST API. Appwrite aims to help you develop your apps faster and in a more secure way. Use the Ruby SDK to integrate your app with the Appwrite server to easily start interacting with all of Appwrite backend APIs and tools. For full API documentation and tutorials go to [https://appwrite.io/docs](https://appwrite.io/docs)

![Appwrite](https://github.com/appwrite/appwrite/raw/main/public/images/github.png)

## Installation

To install via [Gem](https://rubygems.org/):

```bash
gem install appwrite
```


## Getting Started

### Init your SDK
Initialize your SDK with your Appwrite server API endpoint and project ID which can be found in your project settings page and your new API secret Key from project's API keys section.

```ruby
require 'appwrite'

client = Appwrite::Client.new()

client
    .set_endpoint(ENV["APPWRITE_ENDPOINT"]) # Your API Endpoint
    .set_project(ENV["APPWRITE_PROJECT"]) # Your project ID
    .set_key(ENV["APPWRITE_SECRET"]) # Your secret API key
    .setSelfSigned() # Use only on dev mode with a self-signed SSL cert
;
```

### Make Your First Request
Once your SDK object is set, create any of the Appwrite service objects and choose any request to send. Full documentation for any service method you would like to use can be found in your SDK documentation or in the [API References](https://appwrite.io/docs) section.

```ruby
users = Appwrite::Users.new(client);

user = users.create(userId: Appwrite::ID::unique(), email: "email@example.com", phone: "+123456789", password: "password", name: "Walter O'Brien");
```

### Full Example
```ruby
require 'appwrite'

client = Appwrite::Client.new()

client
    .set_endpoint(ENV["APPWRITE_ENDPOINT"]) # Your API Endpoint
    .set_project(ENV["APPWRITE_PROJECT"]) # Your project ID
    .set_key(ENV["APPWRITE_SECRET"]) # Your secret API key
    .setSelfSigned() # Use only on dev mode with a self-signed SSL cert
;

users = Appwrite::Users.new(client);

user = users.create(userId: Appwrite::ID::unique(), email: "email@example.com", phone: "+123456789", password: "password", name: "Walter O'Brien");
```

### Error Handling
The Appwrite Ruby SDK raises `Appwrite::Exception` object with `message`, `code` and `response` properties. You can handle any errors by catching `Appwrite::Exception` and present the `message` to the user or handle it yourself based on the provided error information. Below is an example.

```ruby
users = Appwrite::Users.new(client);

begin
    user = users.create(userId: Appwrite::ID::unique(), email: "email@example.com", phone: "+123456789", password: "password", name: "Walter O'Brien");
rescue Appwrite::Exception => error
    puts error.message
end
```

### Learn more
You can use the following resources to learn more and get help
- 🚀 [Getting Started Tutorial](https://appwrite.io/docs/getting-started-for-server)
- 📜 [Appwrite Docs](https://appwrite.io/docs)
- 💬 [Discord Community](https://appwrite.io/discord)
- 🚂 [Appwrite Ruby Playground](https://github.com/appwrite/playground-for-ruby)


## Contribution

This library is auto-generated by Appwrite custom [SDK Generator](https://github.com/appwrite/sdk-generator). To learn more about how you can help us improve this SDK, please check the [contribution guide](https://github.com/appwrite/sdk-generator/blob/master/CONTRIBUTING.md) before sending a pull-request.

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/appwrite/appwrite/master/LICENSE) file for more information.
