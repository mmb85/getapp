# frozen_string_literal: true

module Parser
  class Base
    private

    def import_file(name, categories, twitter)
      "importing: Name: #{name}; Categories: #{categories}#{add_twitter(twitter)}"
    end

    def check_file_extension(file_ext, file)
      unless file_ext.include? File.extname(file)
        raise StandardError,
              "Selected service #{ARGV[0]} require some #{file_ext} file"
      end

      true
    end

    def add_twitter(twitter)
      return unless twitter

      twitter.slice!(0) if twitter[0] == '@'
      "; Twitter: @#{twitter}"
    end

    def print_and_return(parsed_content)
      puts parsed_content
      parsed_content
    end
  end
end
