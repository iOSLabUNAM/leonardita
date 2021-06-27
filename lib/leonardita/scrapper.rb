# frozen_string_literal: true

require "net/http"
require "nokogiri"

module Leonardita
  class Scrapper
    attr_writer :raw_data
    attr_reader :uri

    def initialize(url)
      @uri = URI.parse(url)
    end

    def raw_data
      @raw_data ||= response.body
    end

    protected

    def document
      @document ||= Nokogiri::HTML(raw_data)
    end

    def response
      @response ||= Net::HTTP.get_response(uri)
    end
  end
end
