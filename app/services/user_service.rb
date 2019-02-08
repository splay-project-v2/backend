module UserService
  class << self
    def create_user!(req)
      User.create!(req['data']['attributes'])
    end
  end
end
