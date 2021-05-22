# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logout', type: :request do
  subject(:user) { create(:user) }

  it 'success with correct params' do
    post login_path, params: { session: { email: user.email, password: user.password } }

    delete logout_path

    expect(response).to redirect_to(root_path)

    expect(session[:current_user_id]).to be_nil
  end
end
