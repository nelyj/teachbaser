require "pry"
require "evil/client"
require "dry-types"
require "dry-struct"
require "oauth2"
require "teachbaser/config"

class Teachbaser
  extend Evil::Client::DSL

  Types = Module.new { |types| types.include Dry::Types.module }

  require 'teachbaser/models/section.rb'
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
    "http://go.teachbase.ru/endpoint/v#{settings.version}/"
  end

  operation do |settings|
    documentation "http://go.teachbase.ru/lurker"

    security do
      key_auth :access_token, settings.access_token, using: :query
    end

    response :success, 200
  end

  def self.config
    @config ||= Config.new
  end

  def self.token
    client = OAuth2::Client.new(
      Teachbaser.config.client_id,
      Teachbaser.config.client_secret,
      site: Teachbaser.config.auth_url
    )
    client.client_credentials.get_token.token
  end
end
