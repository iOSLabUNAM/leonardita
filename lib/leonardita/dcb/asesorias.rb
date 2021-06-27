module Leonardita
  module Dcb
    class Asesorias
      attr_reader :uri
      def initialize
        @uri = URI.parse("http://dcb.ingenieria.unam.mx/index.php/asesorias/")
      end

      def data
        @data ||= build_data
      end

      private

      def build_data
        elements.each_with_object({}) do |node, acc|
          node_name = node.name
          node_data = node&.next&.next
          if node_name == 'h3' && node_data&.name == 'table'
            acc[node.text] = scrape_table(node_data)
          end
        end
      end

      def scrape_table(node)
        weekdays = %w[monday tuesday wednesday thursday friday].freeze
        regex = /[[:alnum:]\/\.\-\?\:]+/.freeze
        url_regex = /https?\:\/\/[[:alnum:]\.\/\?\-]+/.freeze

        node.css('tbody tr').each_with_object([]) do |row, acc|
          values = row.css('td').map(&:text).map { |word| word.scan(regex).join(" ") }
          acc << {
            name: values[0],
            start_at: values[1],
            end_at: values[2],
            days: values[3..7].map(&:empty?).zip(weekdays).reject(&:first).map(&:last),
            classroom: values[8],
            form_url: row.css('td a').attribute('href').value,
            access_data: values[10],
            url: values[10].scan(url_regex).first
          }
        end
      end

      def elements
        document.css('#program').children
      end

      def document
        @document ||= Nokogiri::HTML(response.body)
      end

      def response
        @response ||= Net::HTTP.get_response(uri)
      end
    end
  end
end