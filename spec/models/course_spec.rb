require 'rails_helper'

RSpec.describe Course, type: :model do
  # it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(45) }
  it { is_expected.to validate_presence_of(:description) }
  # it { is_expected.to validate_length_of(:description).is_at_least(2).is_at_most(45) }
  it { should ensure_inclusion_of(:status).in_array(CourseStatus.list) }
end
