class Kitten < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
	validates :softness, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true }
	validates :cuteness, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10,  only_integer: true }
end
