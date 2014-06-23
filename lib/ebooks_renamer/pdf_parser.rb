module EbooksRenamer
  class PdfParser
    class << self
      def parse(filename)
        File.open(filename, "rb") do |io|
          reader = PDF::Reader.new(io)
          if reader && reader.info && reader.info[:Title].present?
            OpenStruct.new title:  reader.info[:Title],
                           author: reader.info[:Author],
                           pages:  reader.page_count
          end
        end
      rescue => e
        # Note: we skip the file that we can't process
        # and allow the process to continue
        puts "Skip file '#{filename}'"
        puts "Due to the unexpected error: #{e.message}"
      end
    end
  end
end
