# frozen_string_literal: true

require 'spec_helper'
require 'require_all'

require_all 'lib'

RSpec.describe ServiceImporter do
  it { should be_const_defined(:AVAILABLE_SERVICES) }

  describe '#.capterra(file)' do
    it 'expect to return all lines processed' do
      expect(subject.send(:capterra, 'spec/support/capterra.yaml').count).to eq(3)
    end
  end

  describe '#.softwareadvice(file)' do
    it 'expect to return all lines processed' do
      expect(subject.send(:softwareadvice, 'spec/support/softwareadvice.json').count)
        .to eq(2)
    end
  end
end
