# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::FightsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/fights').to be_routable
    end

    it 'routes to #show' do
      expect(get: '/api/v1/fights/1').to be_routable
    end
  end
end
