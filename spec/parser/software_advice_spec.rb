# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require 'require_all'
require 'pry'
require 'json'

require_all 'lib'

RSpec.describe Parser::SoftwareAdvice do
  before do
    @result = Parser::SoftwareAdvice.new('spec/support/softwareadvice.json').perform
  end

  context 'When the file is correctly processed' do
    it 'should include the expected lines' do
      expect(@result.count).to eq(2)
    end

    it 'should include all the expected content' do
      expect(@result[0]).to eq('importing: ' \
                               'Name: Freshdesk; ' \
                               'Categories: Customer Service, Call Center; ' \
                               'Twitter: @freshdesk')
    end

    context 'When a line has no twitter' do
      it 'should include the line properly' do
        expect(@result[1]).to eq('importing: ' \
                                 'Name: Zoho; ' \
                                 'Categories: CRM, Sales Management')
      end
    end
  end
end
