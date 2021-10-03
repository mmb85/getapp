# frozen_string_literal: true

module Parser
  class SoftwareAdvice < Base
    attr_reader :file

    require 'json'

    FILE_EXT = %w[json].freeze

    def initialize(filename)
      check_file_extension(FILE_EXT, filename)

      @file = JSON.parse(File.read(filename))
    end

    def perform
      parsed_content = []
      file.values.flatten.each do |row|
        parsed_content << import_line(row['title'], parse_tags(row), row['twitter'])
      end

      print_and_return(parsed_content)
    end

    private

    def parse_tags(row)
      row['categories'].join(', ')
    end
  end
end
