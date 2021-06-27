# frozen_string_literal: true

module Leonardita
  module Dcb
    class ScheduleScrapper < Scrapper
      WEEKDAYS = %w[monday tuesday wednesday thursday friday].freeze

      def data
        @data ||= build_data
      end

      private

      def build_data
        document.css("#program").children.each_with_object({}) do |node, acc|
          node_name = node.name
          node_data = node&.next&.next
          acc[node.text] = scrape_table(node_data) if node_name == "h3" && node_data&.name == "table"
        end
      end

      def scrape_table(node)
        node.css("tbody tr").each_with_object([]) do |row, acc|
          acc << scrape_table_row(row)
        end
      end

      def scrape_table_row(row)
        values = row_values(row)
        {
          name: values[0],
          start_at: values[1],
          end_at: values[2],
          days: values[3..7].map(&:empty?).zip(WEEKDAYS).reject(&:first).map(&:last),
          classroom: values[8],
          form_url: row.css("td a").attribute("href").value,
          access_data: values[10],
          url: values[10].scan(url_regex).first
        }
      end

      def row_values(row)
        row.css("td").map(&:text).map { |word| word.scan(safe_row_regex).join(" ") }
      end

      def safe_row_regex
        @safe_row_regex ||= %r{[[:alnum:]/.\-?:]+}
      end

      def url_regex
        @url_regex ||= %r{https?://[[:alnum:]./?\-]+}
      end
    end
  end
end
