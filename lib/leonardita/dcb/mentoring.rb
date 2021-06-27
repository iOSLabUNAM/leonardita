# frozen_string_literal: true

module Leonardita
  module Dcb
    class Mentoring < ScheduleScrapper
      def initialize
        super("http://dcb.ingenieria.unam.mx/index.php/asesorias/")
      end
    end
  end
end
