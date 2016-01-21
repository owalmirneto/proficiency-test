require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { should belong_to(:student) }
  it { is_expected.to validate_presence_of(:student_id) }
  it { should ensure_inclusion_of(:student_id).in_array(StudentStatus.values_for(%w(ACTIVE))) }

  it { should belong_to(:course) }
  it { is_expected.to validate_presence_of(:course_id) }
  it { should ensure_inclusion_of(:course_id).in_array(CourseStatus.values_for(%w(WAIT OPEN))) }

  # it { is_expected.to validate_uniqueness_of(:student_id).scoped_to(:course_id) }
  let(:student) { Student.create(name: "Walmir Neto", register_number: 'ABC1234', status: StudentStatus::ACTIVE) }
  let(:course) { Course.create(name: "Frevo", description: 'on Rails', status: CourseStatus::OPEN) }
  let(:classroom) { Classroom.new(student: student, course: course) }

  describe 'when student is already enrolled at course' do
    before { Classroom.create(student: student, course: course) }
    it do
      classroom.valid?
      expect(classroom.errors).to have_key(:student_id)
    end
  end
end
