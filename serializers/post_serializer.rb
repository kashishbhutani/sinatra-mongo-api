# Ruby class to serialize posts into JSON documents.
class PostSerializer
    def initialize(post)
      @post = post
    end
  
    def as_json(*)
        data = {
            id: @post.id.to_s,
            title: @post.title,
            description: @post.description,
        }

        data[:errors] = @post.errors if @post.errors.any?

        data
    end
end