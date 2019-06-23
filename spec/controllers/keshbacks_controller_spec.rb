# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KeshbacksController, type: :controller do
  let!(:user) { build(:user, email: 'test@test.com') }

  login_user

  describe 'before actions' do
    describe 'find_keshback' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:find_keshback)
      end
    end
  end

  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context 'GET #show' do
    let!(:keshback) { create :keshback, user: user }

    it 'should success and render to edit page' do
      get :show, params: { id: keshback.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  context 'GET #edit' do
    let!(:keshback) { create :keshback, user: user }

    it 'should success and render to edit page' do
      get :edit, params: { id: keshback.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end
  context 'PUT #update' do
    let!(:keshback) { create :keshback, user: user }

    it 'should update keshback info' do
      params = {
        name: 'a',
        count: '1',
        link: 'c',
        description: 'd'
      }

      put :update, params: { id: keshback.id, keshback: params }
      keshback.reload
      params.keys.each do |key|
        expect(keshback.attributes[key.to_s]).to eq params[key]
      end
    end
  end
  context 'POST #create' do
    it 'should update keshback info' do
      params = {
        name: 'a',
        count: '1',
        link: 'c',
        description: 'd'
      }

      post :create, params: { keshback: params }
    end
  end

  context 'DELETE #destroy' do
    let!(:keshback) { create :keshback, user: user }

    it 'should delete keshback' do
      expect { delete :destroy, params: { id: keshback.id } }.to change(Keshback, :count).by(-1)
    end
  end
end
