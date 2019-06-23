require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  context 'GET #index' do
   it 'should success and render to index page' do
      get :about
      expect(response).to have_http_status(200)
      expect(response).to render_template :about
   end
  end
end
