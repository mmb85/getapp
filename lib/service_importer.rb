# frozen_string_literal: true

module ServiceImporter
  require 'parser/capterra'
  require 'parser/software_advice'

  AVAILABLE_SERVICES = %w[capterra softwareadvice].freeze

  def self.capterra
    Parser::Capterra.execute
  end

  def self.softwareadvice
    Parser::SoftwareAdvice.execute
  end
end
