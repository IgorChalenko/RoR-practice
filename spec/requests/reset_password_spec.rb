# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ResetPassword', type: :request do
  let(:user) { create(:user) }
  it 'render password resset form' do
    get password_reset_path

    expect(response).to render_template(:new)
  end

  it 'redirect to root path if succesfuly' do
    post password_reset_path, params: { user: { email: user.email } }

    expect(response).to redirect_to(root_path)
    expect(flash[:success]).to be_present
  end

  let(:token) { user.signed_id(purpose: 'password_reset', expires_in: 15.minutes)}
  
  it 'rendering update form ' do
   get password_reset_edit_path, params: { token: token}
   expect(response).to render_template(:edit)
  end

  it 'redirect to login path if password update success' do
    patch password_reset_update_path, params: { token: token, user: { password: user.password, 
                                                password_confirmation: user.password_confirmation}}
    expect(response).to redirect_to(login_path)
    expect(flash[:success]).to be_present
  end

end
