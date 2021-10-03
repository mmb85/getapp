# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require 'require_all'

require_all 'lib'

RSpec.describe Parser::Capterra do
  before do
    @result = Parser::Capterra.new('spec/support/capterra.yaml').perform
  end

  context 'When the file is correctly processed' do
    it 'should include the expected lines' do
      expect(@result.count).to eq(3)
    end

    it 'should include all the expected content' do
      expect(@result[0]).to eq('importing: ' \
                               'Name: GitHub; ' \
                               'Categories: Bugs & Issue Tracking, Development Tools; ' \
                               'Twitter: @github')
    end
  end
end
