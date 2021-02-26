require 'jwt'
class AuthorizeApiRequest
    prepend SimpleCommand
  
    def initialize(headers = {})
      @headers = headers
    end
  
    def call
      user
    end
  
    private
  
    attr_reader :headers
  
    def user
      @user ||= User.find(decoded_token[:user_id]) if decoded_token
      @user || errors.add(:token, 'Invalid token') && nil
    end
  
    def decoded_token
      @decoded_token ||= JWT.decode(http_auth_header, 'my_s3cr3t')
    end
  
    def http_auth_header
      if headers && headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      else
        errors.add :token, 'Missing token'
      end
      nil
    end
end