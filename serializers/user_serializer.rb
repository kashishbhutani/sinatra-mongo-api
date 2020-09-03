# Ruby class to serialize users into JSON documents.
class UserSerializer
    def initialize(user)
      @user = user
    end
  
    def as_json(*)
        data = {
            id: @user.id.to_s,
            name: @user.name,
            mobile: @user.mobile,
            email: @user.email
        }

        data[:errors] = @user.errors if @user.errors.any?

        data
    end
end