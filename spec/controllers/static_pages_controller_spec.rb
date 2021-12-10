require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    it 'should get home page' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #help' do
    it 'should get help page' do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #about' do
    it 'should get about page' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #contact' do
    it 'should get contact page' do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end
end
