# frozen_string_literal: true

require 'spec_helper'
require 'require_all'

require_all 'lib'

RSpec.describe Parser::Base do
  describe '#import_line' do
    let(:name) { 'name' }
    let(:categories) { 'categories' }
    let(:twitter) { 'twitter' }

    it 'export the line properly' do
      expect(subject.send(:import_line, 'name', 'categories', 'twitter'))
        .to eq("importing: Name: #{name}; Categories: #{categories}; Twitter: @twitter")
    end
  end

  describe '#check_file_extension' do
    file_ext = %w[yaml yml]

    context 'when the extension match' do
      file = 'file.yaml'
      it 'expect to return true' do
        expect(subject.send(:check_file_extension, file_ext, file)).to eq(true)
      end
    end

    context 'when the extension mismatch' do
      file = 'file.json'
      it 'expect to raise Error' do
        expect { subject.send(:check_file_extension, file_ext, file) }
          .to raise_error StandardError
      end
    end
  end

  describe '#add_twitter(twitter)' do
    context 'when there is twitter param' do
      context 'when @ is present on twitter user' do
        let(:twitter) { '@twitter' }
        it 'should return "; Twitter: @#{twitter}"' do
          expect(subject.send(:add_twitter, twitter)).to eq("; Twitter: #{twitter}")
        end
      end
      context 'when @ is missing on twitter user' do
        let(:twitter) { 'twitter' }
        it 'should include @ character in the response' do
          expect(subject.send(:add_twitter, twitter)).to eq("; Twitter: @#{twitter}")
        end
      end
    end

    context 'when twitter param is not present' do
      let(:twitter) { nil }
      it 'should return nil' do
        expect(subject.send(:add_twitter, twitter)).to eq(nil)
      end
    end
  end

  describe '#print_and_return(parsed_content)' do
    let(:parsed_content) do
      'importing: '\
      'Name: Freshdesk; '\
      'Categories: Customer Service, Call Center; '\
      'Twitter: @freshdesk'
    end

    it 'should return parsed content' do
      expect(subject.send(:print_and_return, parsed_content)).to eq(parsed_content)
    end

    it 'should print the content in console' do
      expect(STDOUT).to receive(:puts).with(parsed_content)
      subject.send(:print_and_return, parsed_content)
    end
  end
end
