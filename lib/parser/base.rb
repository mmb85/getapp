# frozen_string_literal: true

module Parser
  class Base
    attr_reader :file

    require 'yaml'

    def initialize(file)
      @file = YAML.load_file(file)
    end

    def execute
      puts "PARSING DATA for #{file}"
      puts file.inspect
    end
  end
end
