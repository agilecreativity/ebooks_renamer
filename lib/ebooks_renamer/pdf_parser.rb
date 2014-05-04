require 'pry'
module EbooksRenamer
  class PdfParser
    class << self
      def parse(filename)
        File.open(filename, 'rb') do |io|
          reader = PDF::Reader.new(io)
          if reader && reader.info && reader.info[:Title].present?
            OpenStruct.new title:  reader.info[:Title],
                           author: reader.info[:Author],
                           pages:  reader.page_count
          end
        end
      end
    end
  end
end
