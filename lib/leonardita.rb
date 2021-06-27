# frozen_string_literal: true

require_relative "leonardita/version"
require_relative "leonardita/scrapper"
require_relative "leonardita/dcb/schedule_scrapper"
require_relative "leonardita/dcb/mentoring"
require_relative "leonardita/dcb/workshops"

module Leonardita
  class Error < StandardError; end
  # Your code goes here...

  def self.mentoring
    @mentoring ||= Dcb::Mentoring.new.data
  end

  def self.workshops
    @workshops ||= Dcb::Workshops.new.data
  end
end
