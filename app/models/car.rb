class Car < ApplicationRecord
    has_many :rentees, dependent: :destroy
    validates :make, presence: true, length: { minimum: 4 } 
    validates :model, presence: true, length: { minimum: 2 } 
    validates :year, presence: true, length: { is: 4 } , numericality: { only_integer: true }
    validates :color, presence: true, length: { minimum: 4 } 
    validates :description, presence: true, length: { minimum: 5 } 
end
