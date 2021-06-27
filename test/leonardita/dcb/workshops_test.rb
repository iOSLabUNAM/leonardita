# frozen_string_literal: true

require "test_helper"

module Leonardita
  module Dcb
    class WorkshopsTest < Minitest::Test
      def scrapper
        @scrapper = Workshops.new
      end

      def test_scrape_data
        VCR.use_cassette("talleres") do
          assert_equal 24, scrapper.data.count
        end
      end
    end
  end
end
