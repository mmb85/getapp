# frozen_string_literal: true

module ServiceImporter
  require_relative 'parser/base'
  require 'parser/capterra'
  require 'parser/software_advice'

  AVAILABLE_SERVICES = %w[capterra softwareadvice].freeze

  def self.capterra(file)
    Parser::Capterra.new(file).perform
  end

  def self.softwareadvice(file)
    Parser::SoftwareAdvice.new(file).perform
  end
end
