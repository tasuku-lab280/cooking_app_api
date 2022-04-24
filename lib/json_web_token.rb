require 'net/http'
require 'uri'

class JsonWebToken
  # クラスメソッド
  def self.verify(token)
    options = {
      algorithm: 'RS256',
      iss: ENV['AUTH0_DOMAIN'],
      verify_iss: true,
      aud: ENV['AUTH0_IDENTIFIER'],
      verify_aud: true,
    }
    JWT.decode(token, nil, true, **options) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("#{ENV['AUTH0_DOMAIN']}.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    jwks_keys.map.to_h do |k|
      [k['kid'], OpenSSL::X509::Certificate.new(Base64.decode64(k['x5c'].first)).public_key]
    end
  end
end
