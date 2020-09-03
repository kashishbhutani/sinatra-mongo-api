#Users API(Version 1)

namespace '/api/v1' do

    # set content type to JSON
    before do
        content_type 'application/json'
    end

    #GET /api/v1/users | Index
    get '/users' do
        users = User.all

        users.map { |user| UserSerializer.new(user) }.to_json
    end
    
    #GET /api/v1/users/:id | Show
    get '/users/:id' do |id|
        begin
            user = User.where(id: id).first

            raise Exception, "User Not Found!" unless user.present?
    
            UserSerializer.new(user).to_json
        rescue Exception => e
            status 404
            { message: e.message }.to_json
        end
    end
    
    #POST /api/v1/users | Create
    post '/users' do
        begin
            user = User.new(json_params)

            if user.save
                status 201
            else
                raise Exception, user.errors.full_messages.first
            end
        rescue Exception => e
            status 422
			{ message: e.message }.to_json
		end
    end

    #PUT /api/v1/users/:id | Update
    put '/users/:id' do |id|
        begin
            user = User.where(id: id).first
      
            raise Exception, "User Not Found!" unless user.present?

            if user.update(json_params)
                status 201
            else
                raise Exception, user.errors.full_messages.first
            end
        rescue Exception => e
            status 422
			{ message: e.message }.to_json
		end
    end
    
    #DELETE /api/v1/users/:id | Destroy
    delete '/users/:id' do |id|
        begin
            user = User.where(id: id).first
      
            raise Exception, "User Not Found!" unless user.present?
            
            if user.destroy
                status 204
            else
                raise Exception, user.errors.full_messages.first
            end
        rescue Exception => e
            status 422
			{ message: e.message }.to_json
		end
    end

end