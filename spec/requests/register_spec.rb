# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register', type: :request do
  subject(:user) { create(:user) }
  it 'create user with valid parametrs' do
    post registration_path, params: { user: { username: :username, email: :email,
                                              password: :password, password_confirmation: :password_confirmation } }
    expect(response).to redirect_to(root_path)
  end

  it 'render registration form when fail registration with username nil' do
    post registration_path, params: { user: { username: nil, email: :email,
                                              password: :password, password_confirmation: :password_confirmation } }
    expect(response).to render_template(:new)
  end

  it 'render registration form when fail registration with email nil' do
    post registration_path, params: { user: { username: :username, email: nil,
                                              password: :password, password_confirmation: :password_confirmation } }
    expect(response).to render_template(:new)
  end

  it 'render registration form when fail registration with password nil' do
    post registration_path, params: { user: { username: :username, email: :email,
                                              password: nil, password_confirmation: :password_confirmation } }
    expect(response).to render_template(:new)
  end

  it 'render registration form when fail registration with non assert password_confirmation' do
    post registration_path, params: { user: { username: nil, email: :email,
                                              password: :password, password_confirmation: '654321' } }
    expect(response).to render_template(:new)
  end
end
