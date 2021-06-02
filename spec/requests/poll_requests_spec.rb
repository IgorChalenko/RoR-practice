require 'rails_helper'

RSpec.describe 'PollRequest', type: :request do
  subject(:poll) { build(:poll) }

  it 'create pol with valid parametrs' do
    post poll_new_path, params: { poll: { title: poll.title, description: poll.description,
                                              start_date: poll.start_date, end_date: poll.end_date } }
    expect(response).to redirect_to(root_path)
  end

  it 'render poll form when fail registration with title nil' do
    post poll_new_path, params: { poll: { title: nil, description: poll.description,
      start_date: poll.start_date, end_date: poll.end_date } }
    expect(response).to render_template('new')
  end

  it 'render poll form when fail registration with start date nil' do
    post poll_new_path, params: { poll: { title: poll.title, description: poll.description,
      start_date: nil, end_date: poll.end_date } }
    expect(response).to render_template(:new)
  end

  it 'render poll form when fail registration with end date nil' do
    post poll_new_path, params: { poll: { title: poll.title, description: poll.description,
      start_date: poll.start_date, end_date: nil } }
    expect(response).to render_template(:new)
  end

end
