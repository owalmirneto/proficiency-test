class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, presence: true, uniqueness: { scope: :course, message: 'já está inscrito nesse curso' }
  validates :course, presence: true
end
