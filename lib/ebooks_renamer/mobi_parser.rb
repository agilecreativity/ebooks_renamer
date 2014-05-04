module EbooksRenamer
  class MobiParser
    class << self
      def parse(filename)
        meta = Mobi.metadata(File.open(filename))
        OpenStruct.new title:     meta.title,
                       author:    meta.author,
                       publisher: meta.publisher
      end
    end
  end
end
