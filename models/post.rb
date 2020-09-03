class Post
    include Mongoid::Document
  
    #Model Schema
    field :title, type: String
    field :description, type: String
 
    #Validations
    validates :title, presence: true, length: { minimum: 5, maximum: 255 }
    validates :description, presence: true

    #Associations
    belongs_to :user

end