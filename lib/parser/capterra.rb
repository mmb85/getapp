# frozen_string_literal: true

module Parser
  class Capterra < Base
    attr_reader :file

    require 'yaml'

    FILE_EXT = %w[.yml .yaml].freeze

    def initialize(filename)
      check_file_extension(FILE_EXT, filename)
      @file = YAML.load_file(filename)
    end

    def perform
      parsed_content = []
      file.each do |row|
        parsed_content << import_file(row['name'], parse_tags(row), row['twitter'])
      end
    end

    private

    def parse_tags(row)
      row['tags'].split(',').join(', ')
    end
  end
end
