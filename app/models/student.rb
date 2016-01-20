class Student < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 , maximum: 45}
  validates :register_number, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :status, presence: true
end
