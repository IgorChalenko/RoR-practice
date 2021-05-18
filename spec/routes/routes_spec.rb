# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it { should route(:get, '/pages/').to(action: :index) }
end
