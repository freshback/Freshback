require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user){
    create(:user)
  }
  let!(:keshback){
    create(:keshback)
  }

  subject{
     build(:comment)
  }

  context "validation" do

    it { should validate_presence_of(:text) }

    it "should not be valid without text" do
       subject.text = nil
       expect(subject).to_not be_valid
    end
  end

  context "association" do
    it { should belong_to(:user) }
    it { should belong_to(:keshback) }
    end
end
