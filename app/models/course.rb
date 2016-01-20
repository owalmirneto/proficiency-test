class Course < ActiveRecord::Base
  has_enumeration_for :status, with: CourseStatus, create_helpers: { prefix: true }

  validates :name, length: { minimum: 2 , maximum: 45 }
  validates :status, inclusion: { in: CourseStatus.list }
  validates :description, length: { minimum: 2 , maximum: 45 }, allow_blank: true
end
