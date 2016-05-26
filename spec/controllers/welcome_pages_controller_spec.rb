require 'rails_helper'

RSpec.describe WelcomePagesController, type: :controller do
  it 'GET #welcome' do
    get :welcome
    expect(response).to have_http_status(:success)   
  end
end
