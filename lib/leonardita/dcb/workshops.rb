# frozen_string_literal: true

module Leonardita
  module Dcb
    class Workshops < ScheduleScrapper
      def initialize
        super("http://dcb.ingenieria.unam.mx/index.php/talleres/")
      end
    end
  end
end
