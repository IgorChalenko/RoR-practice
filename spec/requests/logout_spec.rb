# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logout', type: :request do
  subject(:user) { create(:user) }

  it 'success with correct params' do
    delete logout_path, params: { session: :current_user_id }
    expect(response).to redirect_to(root_path)

    expect(session[:current_user_id]).to eq(nil)
  end
end
