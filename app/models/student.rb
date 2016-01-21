class Student < ActiveRecord::Base
  has_many :classrooms, dependent: :restrict_with_exception
  has_many :users, through: :classrooms

  has_enumeration_for :status, with: StudentStatus, create_helpers: { prefix: true }

  validates :name, length: { minimum: 2 , maximum: 45 }
  validates :register_number, length: { minimum: 2 , maximum: 45 }, uniqueness: true
  validates :status, presence: true, inclusion: { in: StudentStatus.list }
end
