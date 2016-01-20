class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, uniqueness: { scope: :course, message: 'já está inscrito nesse curso' }
end
