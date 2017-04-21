require "pry"
require "evil/client"
require "dry-types"
require "dry-struct"

class Teachbaser
  extend Evil::Client::DSL

  Types = Module.new { |types| types.include Dry::Types.module }

  class Authorization < Evil::Struct
    attribute :access_token, Types::Strict::String
    attribute :token_type,   Types::Strict::String
    attribute :created_at,   Types::Form::DateTime
  end

  %w(types models operations).each do |folder|
    path = File.expand_path("../teachbaser/#{folder}/*.rb", __FILE__)
    Dir[path].each { |file| require(file) }
  end

  settings do
    option :version,       Types::Version, default: proc { 1 }
    option :access_token,  Types::Strict::String, optional: true
    option :local,         Types::Form::Bool, default: proc { false }
    option :test,          Types::Form::Bool, default: proc { false }
  end

  base_url do |settings|
    domain = settings.local ? 'localhost:3001' : 'go.teachbase.ru'
    "http://#{domain}/endpoint/v#{settings.version}/"
  end

  operation do |settings|
    documentation "http://go.teachbase.ru/lurker"

    security do
      key_auth :access_token, settings.access_token, using: :query
    end

    response :success, 200
  end

  operation :get_access_token do |settings|
    http_method :post

    path do
      domain = settings.local ? 'localhost:3001' : 'go.teachbase.ru'
      "http://#{domain}/oauth/token"
    end

    body format: "json" do
      attributes do
        attribute :client_id,     Types::Strict::String
        attribute :client_secret, Types::Strict::String
        attribute :grant_type,    Types::Strict::String, default: proc { 'client_credentials' }
      end
    end

    response :success, 200, format: :json, model: Authorization
    response :error, 401, format: :json, raise: true do
      attribute :error
    end
  end
end
