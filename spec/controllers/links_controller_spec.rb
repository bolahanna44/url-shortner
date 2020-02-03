require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'create' do
    it 'should set link instant variable' do
      post :create, params: attributes_for(:link)
      expect(assigns(:link).short_url).not_to be_blank
    end
  end

  describe 'show' do
    it 'should redirect to original url' do
      link = create(:link)
      get :show, params: { short_url: link.short_url }
      expect(response).to redirect_to link.original_url
    end
  end
end
