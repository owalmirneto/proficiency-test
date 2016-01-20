class Course < ActiveRecord::Base
  has_enumeration_for :status, with: CourseStatus, required: true

  validates :name, presence: true, length: { minimum: 2 , maximum: 45 }
  validates :description, presence: true, length: { minimum: 2 , maximum: 45 }, uniqueness: true
  validates :status, presence: true, inclusion: { in: CourseStatus.list }
end
