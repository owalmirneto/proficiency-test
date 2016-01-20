require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to validate_uniqueness_of(:register_number) }
  it { is_expected.to validate_presence_of(:status) }
  it { should ensure_inclusion_of(:status).in_array(StudentStatus.list) }

  let(:student) { Student.new(name: "Walmir Neto", register_number: 'ABC1234', status: StudentStatus::ACTIVE) }

  describe 'when name is too long' do
    before { student.name = 'ab123' * 10 }
    it do
      student.valid?
      expect(student.errors).to have_key(:name)
    end
  end

  describe 'when register_number is too long' do
    before { student.register_number = '1234' * 12 }
    it do
      student.valid?
      expect(student.errors).to have_key(:register_number)
    end
  end

  describe 'when register_number is already taken' do
    before do
      Student.create(name: "Walmir Neto", register_number: '171069', status: StudentStatus::ACTIVE)
      student.register_number = '171069'
    end
    it do
      student.valid?
      expect(student.errors).to have_key(:register_number)
    end
  end
end
