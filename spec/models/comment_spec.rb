require "rails_helper"

describe Comment do
  subject(:comment) { build(:comment) }

  it {
    should validate_uniqueness_of(:user_id)
      .scoped_to(:movie_id)
      .with_message("Movie aready commented")
  }
  it { should validate_presence_of :movie_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :content }
end
