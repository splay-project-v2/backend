module AuthenticationService
  class << self
    def authenticate!(req)
      user = User.find_for_authentication(login: req['data']['attributes']['login'])
      raise Unauthorized, 'Bad credentials' if user.nil? || !user.valid_password?(req['data']['attributes']['password'])

      user
    end
  end

  class Unauthorized < StandardError; end
end
