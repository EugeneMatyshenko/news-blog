require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'GET #index' do
    it 'returns a success responce' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET #show' do
    it 'returns a success responce' do
      user = User.create!(first_name: 'First', last_name: 'Last')
      get :show, params: { id: user.to_param }
      expect(response).to be_success
    end
  end

end
