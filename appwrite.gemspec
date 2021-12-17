Gem::Specification.new do |spec|

  spec.name = 'appwrite'
  spec.version = '2.4.1'
  spec.license = 'BSD-3-Clause'
  spec.summary = 'Appwrite is an open-source self-hosted backend server that abstract and simplify complex and repetitive development tasks behind a very simple REST API'
  spec.author = 'Appwrite Team'
  spec.homepage = 'https://appwrite.io/support'
  spec.email = 'team@appwrite.io'
  spec.files = Dir['lib/**/*.rb']

  spec.add_dependency 'mime-types', '~> 3.3.1'
end