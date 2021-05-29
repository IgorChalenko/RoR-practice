require 'rails_helper'

RSpec.describe 'PasswordReset', type: :request do
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
end
