# frozen_string_literal: true

module Parser
  class Base
    private

    def import_line(name, categories, twitter)
      "importing: Name: #{name}; Categories: #{categories}#{add_twitter(twitter)}"
    end

    def check_file_extension(file_ext, file)
      unless file_ext.include? File.extname(file).delete('.')
        raise StandardError,
              "Selected service #{ARGV[0]} require some #{file_ext} file"
      end

      true
    end

    def add_twitter(twitter)
      return unless twitter

      "; Twitter: @#{twitter[0] == '@' ? twitter[1..-1] : twitter}"
    end

    def print_and_return(parsed_content)
      puts parsed_content
      parsed_content
    end
  end
end
