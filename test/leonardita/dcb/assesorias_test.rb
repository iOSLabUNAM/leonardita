# frozen_string_literal: true

require "test_helper"

module Leonardita
  module Dcb
    class AssesoriasTest < Minitest::Test
      def scrapper
        @scrapper = Asesorias.new
      end

      def test_scrape_data
        VCR.use_cassette("asseorias") do
          assert_equal 42, scrapper.data.count
        end
      end
    end
  end
end
