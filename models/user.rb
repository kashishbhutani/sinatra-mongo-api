class User
    include Mongoid::Document
  
    #Model Schema
    field :name, type: String
    field :mobile, type: String
    field :email, type: String
  
    #Validations
    validates :name, presence: true, length: { minimum: 3, maximum: 255 }
    validates :mobile, presence: true, length: { maximum: 10 }
    validates :email, presence: true

    #Associations
    has_many :posts

end