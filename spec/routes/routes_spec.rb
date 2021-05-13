# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'Routing', type: :routing do
    it do
      should route(:get, '/pages')
        .to('pages#index')
    end
  end
end
