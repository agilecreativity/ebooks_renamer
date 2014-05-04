module EbooksRenamer
  class EpubParser
    class << self
      def parse(filename)
        info = EPUBInfo.get(filename)
        if info.present?
          title     = info.titles.first if info.titles
          author    = info.creators.map(&:name).first if info.creators
          publisher = info.publisher
          if title.present?
            OpenStruct.new title:     title,
                           author:    author,
                           publisher: publisher
          end
        end
      end
    end
  end
end
