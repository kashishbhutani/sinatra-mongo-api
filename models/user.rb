# Models
class User
    include Mongoid::Document
  
    #Model Schema
    field :name, type: String
    field :mobile, type: String
    field :email, type: String
  
    #Validations
    validates :name, presence: true
    validates :mobile, presence: true
    validates :email, presence: true

end