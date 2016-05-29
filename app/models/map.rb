class Map < ActiveRecord::Base
  belongs_to :user
  has_many :noms
end
