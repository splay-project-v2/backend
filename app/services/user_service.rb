module UserService
  class << self
    def create_user!(req)
      User.create!(
        email: req['data']['attributes']['email'],
        username: req['data']['attributes']['username'],
        password: req['data']['attributes']['password'],
        password_confirmation: req['data']['attributes']['password_confirmation']
      )
    end
  end
end
