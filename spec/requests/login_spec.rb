# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :request do
  subject(:user) { create(:user) }

  it 'success whith email and password correct' do
    post login_path, params: { session: { email: user.email, password: user.password } }

    expect(response).to redirect_to(root_path)

    expect(session[:current_user_id]).to eq(user.id)
  end

  it 'fails whith incorrect email' do
    post login_path, params: { session: { email: 'bad@mail.com', password: user.password } }

    expect(response).to render_template(:new)

    expect(session[:current_user_id]).to be_nil
  end

  it 'fails whith incorrect email' do
    post login_path, params: { session: { email: user.email, password: '654321' } }

    expect(response).to render_template(:new)

    expect(session[:current_user_id]).to be_nil
  end
end
