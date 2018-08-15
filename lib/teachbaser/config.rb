require 'anyway'

class Teachbaser
  class Config < Anyway::Config
    attr_config :client_id, :client_secret,
      auth_url: 'https://go.teachbase.ru/oauth/token'
  end
end
