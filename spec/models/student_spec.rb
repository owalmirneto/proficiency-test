require 'rails_helper'

RSpec.describe Student, type: :model do
  # it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(45) }
  # it { is_expected.to validate_length_of(:register_number).is_at_least(2).is_at_most(45) }
  it { is_expected.to validate_uniqueness_of(:register_number) }
  it { is_expected.to validate_presence_of(:status) }
  it { should ensure_inclusion_of(:status).in_array(StudentStatus.list) }
end
