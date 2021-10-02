# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require 'require_all'
require 'pry'

require_all 'lib'

RSpec.describe Parser::Capterra do
  before do
    @result = Parser::Capterra.new('spec/support/capterra.yaml').perform
  end

  context 'When the file is correctly processed' do
    it 'should include the expected content' do
      expect(@result.count).to eq(3)
      expect(@result[0]).to eq({ 'name' => 'GitHub',
                                 'tags' => 'Bugs & Issue Tracking,Development Tools',
                                 'twitter' => 'github' })
    end

    # it 'should not exclude other valid data' do
    #   expect(@result.to_s).not_to include('22.22.22.22')
    # end
  end
end
