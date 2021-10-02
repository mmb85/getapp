# frozen_string_literal: true

module ServiceImporter
  AVAILABLE_SERVICES = %w[capterra softwareadvice].freeze

  def self.capterra
    puts 'CAPTERRA SERVICE DETECTED'
  end

  def self.softwareadvice
    puts 'SOFTWARE ADVICE SERVICE DETECTED'
  end
end
