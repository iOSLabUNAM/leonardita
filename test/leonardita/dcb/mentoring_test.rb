# frozen_string_literal: true

require "test_helper"

module Leonardita
  module Dcb
    class MentoringTest < Minitest::Test
      def scrapper
        @scrapper = Mentoring.new
      end

      def test_scrape_data
        VCR.use_cassette("asseorias") do
          assert_equal 42, scrapper.data.count
        end
      end
    end
  end
end
