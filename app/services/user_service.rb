module UserService
  class << self
    def create_user!(req)
      attr = req['data']['attributes']
      User.create!(
        email: attr['email'],
        username: attr['username'],
        password: attr['password'],
        password_confirmation: attr['password_confirmation']
      )
    end
  end
end
