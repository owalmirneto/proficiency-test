class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, presence: true,
    uniqueness: { scope: :course, message: 'já está inscrito nesse curso' },
    inclusion: { in: StudentStatus.values_for(%w(ACTIVE)), message: "está inativo" }
  validates :course, presence: true,
    inclusion: { in: CourseStatus.values_for(%w(WAIT OPEN)), message: "está fechado" }
end
