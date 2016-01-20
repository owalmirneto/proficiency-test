class Student < ActiveRecord::Base
  has_enumeration_for :status, with: StudentStatus, required: true

  validates :name, presence: true, length: { minimum: 2 , maximum: 45 }
  validates :register_number, presence: true, length: { minimum: 2 , maximum: 45 }, uniqueness: true
  validates :status, presence: true, inclusion: { in: StudentStatus.list }
end
