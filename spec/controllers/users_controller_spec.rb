require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
   it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
   end
  end

  context 'GET #show' do
 let!(:user) { create :user}

  it 'should success and render to edit page' do
     get :show, params: { id: user.id }
     expect(response).to have_http_status(200)
     expect(response).to render_template :show
  end
end
end
