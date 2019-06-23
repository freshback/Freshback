# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
     build(:user)
    }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "should not be valid without nickname" do
       subject.nickname = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without email" do
       subject.email = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without password" do
       subject.password = nil
       expect(subject).to_not be_valid
    end
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "associations" do
    it { should have_many(:keshbacks).dependent(:destroy)}
    it { should have_many(:comments).dependent(:destroy)}
  end
end
