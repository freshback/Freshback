# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { build(:user, email: 'test@test.com') }
#  let!(:keshback) { build(:keshback) }
  login_user

  context 'POST #create' do
    let!(:keshback) { create :keshback, user: user }
    it 'should update comment info' do
      params = {
        text: 'd'
      }
      post :create, params: { comment: params, keshback: keshback, user: user }
    end
  end
  context 'DELETE #destroy' do
    let!(:keshback) { build(:keshback) }
    let!(:comment) { create :comment, user: user, keshback: keshback }

    it 'should delete comment' do
      expect { delete :destroy, params: { id: comment.id } }.to change(Comment, :count).by(-1)
    end
  end
end
