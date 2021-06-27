# frozen_string_literal: true

require_relative "leonardita/version"
require_relative "leonardita/scrapper"
require_relative "leonardita/dcb/schedule_scrapper"
require_relative "leonardita/dcb/asesorias"
require_relative "leonardita/dcb/talleres"

module Leonardita
  class Error < StandardError; end
  # Your code goes here...
end
