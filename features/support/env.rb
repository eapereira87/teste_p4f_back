require "rspec"
require "httparty"
require "cucumber"
require "json"
require "pry"
require "faker"
require "report_builder"
require "json-schema"

$schema_root = "features/support/schemas/"

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

ENV["ENV"] = "dev" unless ENV.key? "ENV"

ENVIRONMENT = YAML.load_file("./base_uri.yml")[ENV["ENV"]]

puts "Rodando em #{[ENV["ENV"]]}"

class Http
  include HTTParty
  include RSpec::Matchers

  base_uri ENVIRONMENT["api"]
  format :json
end
