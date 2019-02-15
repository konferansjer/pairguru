require "rails_helper"

describe TopCommenters do
  let(:scope) { User.all }

  let(:params) { {} }

  subject { described_class.new(scope).call(params) }

  it "search by date" do
    expect(subject.to_sql).to include("comments.created_at > ")
  end

  it "order by total comments" do
    expect(subject.to_sql).to include("total_comments DESC")
  end

  it "includes limit" do
    expect(subject.to_sql).to include("LIMIT")
  end
end
