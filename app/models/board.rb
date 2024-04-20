class Board
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :player
  field :name, type: String
  field :colors, type: String
  field :matrix, type: String
  field :width, type: Number
  field :height, type: Number
end
