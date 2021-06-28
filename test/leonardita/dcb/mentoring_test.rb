# frozen_string_literal: true

require "test_helper"

module Leonardita
  module Dcb
    class MentoringTest < Minitest::Test
      def scrapper
        @scrapper = Mentoring.new
      end

      def classes
        [
          "ÁLGEBRA (2006)", "ÁLGEBRA (2016)", "ÁLGEBRA LINEAL (2006)", "ÁLGEBRA LINEAL (2016)",
          "ANÁLISIS NUMÉRICO (2006)", "ANÁLISIS NUMÉRICO (2016)", "CÁLCULO DIFERENCIAL (2006)",
          "CÁLCULO INTEGRAL (2006)", "CÁLCULO INTEGRAL (2016)", "CÁLCULO VECTORIAL (2006)",
          "CÁLCULO VECTORIAL (2016)", "CÁLCULO Y GEOMETRÍA ANALÍTICA (2016)",
          "CINEMÁTICA Y DINÁMICA (2006)", "CINEMÁTICA Y DINÁMICA (2016)", "DIBUJO (2006)",
          "DIBUJO (2016)", "ECUACIONES DIFERENCIALES (2006)", "ECUACIONES DIFERENCIALES (2016)",
          "ELECTRICIDAD Y MAGNETISMO (L+) (2016)", "ESTADÍSTICA (2016)",
          "ESTADÍSTICA APLICADA A LA ING. GEOMÁTICA (2016)",
          "ESTADÍSTICA PARA ING. ELÉCTRICA ELECTRÓNICA (2016)", "ESTÁTICA (2006)",
          "ESTÁTICA (2016)", "FÍSICA (L) (2016)", "FÍSICA EXPERIMENTAL (2016)",
          "FUNDAMENTOS DE ESTADÍSTICA (2016)", "FUNDAMENTOS DE FÍSICA (L) (2016)",
          "FUNDAMENTOS DE TERMODINÁM. Y ELECTROMAG. (L+) (2016)", "GEOMETRÍA ANALÍTICA (2006)",
          "INFERENCIA ESTADÍSTICA (2006)", "MATEMÁTICAS AVANZADAS (2006)",
          "MATEMÁTICAS AVANZADAS (2016)", "MECÁNICA (2016)",
          "PRINCIPIOS DE TERMODINÁMICA Y ELECTROMAG (L+) (2006)", "PROBABILIDAD (2016)",
          "PROBABILIDAD Y ESTADÍSTICA (2006)", "QUÍMICA TODAS (L+)", "REPRESENTACIONES GRÁFICAS (2016)",
          "SISTEMAS TERMODINÁMICOS Y ELECTROMAGNETISMO (2016)", "TERMODINÁMICA (L+) (2006)",
          "TERMODINÁMICA (L+) (2016)"
        ]
      end

      def test_scrape_data
        VCR.use_cassette("asseorias") do
          result = scrapper.data
          assert_equal 42, result.count
          assert_equal classes, result.keys
        end
      end
    end
  end
end
