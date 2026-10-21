Gem::Specification.new do |spec|
    spec.name = 'appwrite'
    spec.version = '30.0.1'
    spec.license = 'BSD-3-Clause'
    spec.summary = 'Appwrite is an open-source self-hosted backend server that abstracts and simplifies complex and repetitive development tasks behind a very simple REST API'
    spec.author = 'Appwrite Team'
    spec.homepage = 'https://appwrite.io/support'
    spec.email = 'team@appwrite.io'
    spec.files = Dir['lib/**/*.rb']
    spec.required_ruby_version = '>= 2.7'

    spec.add_dependency 'mime-types', '~> 3.6'
end
