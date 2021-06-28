# frozen_string_literal: true

require "test_helper"

module Leonardita
  module Dcb
    class WorkshopsTest < Minitest::Test
      def scrapper
        @scrapper = Workshops.new
      end

      def classes
        [
          "ÁLGEBRA (2006)", "ÁLGEBRA (2016)", "ÁLGEBRA LINEAL (2006)", "ÁLGEBRA LINEAL (2016)",
          "ANTECEDENTES DE MATEMÁTICAS", "CÁLCULO DIFERENCIAL (2006)", "CÁLCULO INTEGRAL (2006)",
          "CÁLCULO INTEGRAL (2016)", "CÁLCULO VECTORIAL (2006)", "CÁLCULO VECTORIAL (2016)",
          "CÁLCULO Y GEOMETRÍA ANALÍTICA (2016)", "ECUACIONES DIFERENCIALES (2006)",
          "ECUACIONES DIFERENCIALES (2016)", "ELECTRICIDAD Y MAGNETISMO (L+) (2016)",
          "ESTÁTICA (2006)", "ESTÁTICA (2016)", "FUNDAMENTOS DE TERMODINÁM. Y ELECTROMAG. (L+) (2016)",
          "GEOMETRÍA ANALÍTICA (2006)", "MECÁNICA (2016)",
          "PRINCIPIOS DE TERMODINÁMICA Y ELECTROMAG (L+) (2006)", "QUÍMICA TODAS (L+)",
          "SISTEMAS TERMODINÁMICOS Y ELECTROMAGNETISMO (2016)", "TERMODINÁMICA (L+) (2006)",
          "TERMODINÁMICA (L+) (2016)"
        ]
      end

      def test_scrape_data
        VCR.use_cassette("talleres") do
          result = scrapper.data
          assert_equal 24, result.count
          assert_equal classes, result.keys
        end
      end
    end
  end
end
