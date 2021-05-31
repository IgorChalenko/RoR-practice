# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  it 'render new poll form' do
    expect(get: poll_new_path).to route_to(controller: 'polls', action: 'new')
    expect(get: poll_new_path).to render_template('new')
  end
end
