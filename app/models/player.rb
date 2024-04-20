class Player
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :avatar, type: String
  field :color, type: String
  has_many :boards
end
