#Posts API(Version 1)

namespace '/api/v1' do

    # set content type to JSON
    before do
        content_type 'application/json'
    end

    #GET /api/v1/users/:user_id/posts | Index
    get '/users/:user_id/posts' do |user_id|
        begin
            user = User.where(id: user_id).first

            raise Exception, "User Not Found!" unless user.present?

            posts = user&.posts

            raise Exception, "No Post Found!" unless posts.present?

            posts.map { |post| PostSerializer.new(post) }.to_json
        rescue Exception => e
            status 404
            { message: e.message }.to_json
        end
    end

    #GET /api/v1/users/:user_id/posts/:id | Show
    get '/users/:user_id/posts/:id' do |user_id, id|
        begin
            user = User.where(id: user_id).first

            raise Exception, "User Not Found!" unless user.present?

            post = user.posts.where(id: id).first
        
            raise Exception, "Post Not Found!" unless post.present?
            
            PostSerializer.new(post).to_json
        rescue Exception => e
            status 404
			{ message: e.message }.to_json
		end
    end

    #POST /api/v1/users/:user_id/posts | Create
    post '/users/:user_id/posts' do |user_id|
        begin
            user = User.where(id: user_id).first

            raise Exception, "User Not Found!" unless user.present?

            post = user.posts.new(json_params)

            if post.save
                status 201
            else
                raise Exception, post.errors.full_messages.first
            end
        rescue Exception => e
            status 422
			{ message: e.message }.to_json
		end
    end

    #PUT /api/v1/users/:user_id/posts/:id | Update
    put '/users/:user_id/posts/:id' do |user_id, id|
        begin
            user = User.where(id: user_id).first

            raise Exception, "User Not Found!" unless user.present?

            post = user.posts.where(id: id).first
        
            raise Exception, "Post Not Found!" unless post.present?

            if post.update(json_params)
                status 201
            else
                raise Exception, post.errors.full_messages.first
            end
        rescue Exception => e
            status 422
			{ message: e.message }.to_json
		end
    end

    #DELETE /api/v1/users/:user_id/posts/:id | Destroy
    delete '/users/:user_id/posts/:id' do |user_id, id|
        begin
            user = User.where(id: user_id).first

            raise Exception, "User Not Found!" unless user.present?

            post = user.posts.where(id: id).first
        
            raise Exception, "Post Not Found!" unless post.present?
            
            if post.destroy
                status 204
            else
                raise Exception, post.errors.full_messages.first
            end
        rescue Exception => e
            status 422
			{ message: e.message }.to_json
		end
    end

end