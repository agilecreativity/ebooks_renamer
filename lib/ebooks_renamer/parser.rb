require_relative 'pdf_parser'
require_relative 'epub_parser'
require_relative 'mobi_parser'
module EbooksRenamer
  class << self

    class Parser
      attr_reader :parser
      def initialize(parser)
        @parser = parser
      end

      def parse(filename)
        @parser.parse(filename)
      end
    end

    def parse(filename)
      case File.extname(filename)
      when '.epub'
        Parser.new(EpubParser.parse(filename)).parser
      when '.pdf'
        Parser.new(PdfParser.parse(filename)).parser
      when '.mobi'
        Parser.new(MobiParser.parse(filename)).parser
      else
        fail "File type #{File.extname(file)} is not supported"
      end
    end
  end
end
