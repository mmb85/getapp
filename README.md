# GetApp test

# Installation steps
As simple as run
`bin/setup`
It will take care of install all gem through bundler

# How to run your code / tests
## Running program
Execute this command to run the program:

`bin/getapp_import <service> <file_path>`

As example:

`bin/getapp_import softwareadvice feed-products/softwareadvice.json`

Notice that if there's any error on params provided, more/less params or incorrect file format for the selected service i.e. program will respond with the error to be fixed to help the end user.

## Running test suite
Execute this command in order to run the test suite
`bundle exec rspec -fd`

Test files to be used are placed in `spec/support` folder

Output will be listed as follow, allowing easy review on what was tested.

```
Parser::Base
  #import_line
    export the line properly
  #check_file_extension
    when the extension match
      expect to return true
    when the extension mismatch
      expect to raise Error
  #add_twitter(twitter)
    when there is twitter param
      when @ is present on twitter user
        should return "; Twitter: @#{twitter}"
      when @ is missing on twitter user
        should include @ character in the response
    when twitter param is not present
      should return nil
  #print_and_return(parsed_content)
    should return parsed content
    should print the content in console

Parser::Capterra
  When the file is correctly processed
    should include the expected lines
    should include all the expected content

Parser::SoftwareAdvice
  When the file is correctly processed
    should include the expected lines
    should include all the expected content
    When a line has no twitter
      should include the line properly

ServiceImporter
  is expected to be const defined :AVAILABLE_SERVICES
  #.capterra(file)
    expect to return all lines processed
  #.softwareadvice(file)
    expect to return all lines processed
```

# Where to find your code
Main program is placed under lib folder and will run all the logic for a selected service and file calling `ServiceImporter`

`ServiceImporter` has the ownership of list all parsers, depending on selected service and run the parser logic.

 The `parsers logic` were separated in several files according to the providers (capterra, software advice and later a csv provider) and also has a `base` file that include all the common logic to export the results.

# Consideration
I tried to cover as match as possible, also running rubocop (and ignoring some warning) to ensure readability and follow the conventions as much as possible.

Due to the exercise require not to store anything and print the result in the ouput I dig into the documentation finding a way to not print `puts` in test execution https://github.com/mmb85/getapp/blob/main/spec/spec_helper.rb#L17

Also was interesting how to test the response and the output at the same time https://github.com/mmb85/getapp/blob/main/spec/parser/base_spec.rb#L75
