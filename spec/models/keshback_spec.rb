require 'rails_helper'

RSpec.describe Keshback, type: :model do

let!(:user){
  create(:user)
}

subject{
   build(:keshback)
}

context "validation" do

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:link) }

  it { should validate_presence_of(:count) }
  it { should validate_presence_of(:description) }

  #it { should validate_presence_of(:photo) }


#  it "is valid with valid attributes" do
#    expect(subject).to be_valid
#  end

  it "should not be valid without name" do
     subject.name = nil
     expect(subject).to_not be_valid
  end

  it "should not be valid without link" do
     subject.link = nil
     expect(subject).to_not be_valid
  end

  it "should not be valid without count" do
    subject.count = nil
    expect(subject).to_not be_valid
  end
  it "should not be valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end

context "association" do
  it { should belong_to(:user) }
  it { should have_many(:comments).dependent(:destroy)}
  end
end
