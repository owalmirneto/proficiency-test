require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should ensure_inclusion_of(:status).in_array(CourseStatus.list) }

  let(:course) { Course.new(name: "Walmir Neto", description: 'ABC1234', status: CourseStatus::OPEN) }

  describe 'when name is too long' do
    before { course.name = 'ab123' * 10 }
    it do
      course.valid?
      expect(course.errors).to have_key(:name)
    end
  end

  describe 'when description is too long' do
    before { course.description = '1234' * 12 }
    it do
      course.valid?
      expect(course.errors).to have_key(:description)
    end
  end
end
