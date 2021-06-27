# frozen_string_literal: true

require "test_helper"

module Leonardita
  module Dcb
    class TalleresTest < Minitest::Test
      def scrapper
        @scrapper = Talleres.new
      end

      def test_scrape_data
        VCR.use_cassette("talleres") do
          assert_equal 24, scrapper.data.count
        end
      end
    end
  end
end