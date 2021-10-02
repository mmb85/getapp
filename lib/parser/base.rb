# frozen_string_literal: true

module Parser
  class Base
    private

    def import_file(name, categories, twitter)
      row = "importing: Name: #{name};  Categories: #{categories}; Twitter: @#{twitter}\n"
      puts row
      row
    end

    def check_file_extension(file_ext, file)
      unless file_ext.include? File.extname(file)
        raise StandardError,
              "Selected service #{ARGV[0]} require some #{file_ext} file"
      end

      true
    end
  end
end
