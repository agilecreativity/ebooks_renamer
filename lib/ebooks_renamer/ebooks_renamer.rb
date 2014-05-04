require 'mobi'
require 'epubinfo'
require 'pdf-reader'
require 'ostruct'
require 'fileutils'
require 'filename_cleaner'
require 'code_lister'
require_relative 'pdf_parser'
require_relative 'epub_parser'
require_relative 'mobi_parser'
module EbooksRenamer
  CustomError = Class.new(StandardError)
  class << self
    def rename(options = {})
      files = CodeLister.files(options)
      files.each_with_index do |file, index|
        # process as many files as possible
        begin
          new_name = formatted_name(file, options[:sep_string])
          if file != new_name
            puts "#{index + 1} of #{files.length}: Old name: '#{file}'"
            puts "#{index + 1} of #{files.length}: New name: '#{new_name}'"
            FileUtils.mv(file, new_name) if options[:commit]
          else
            puts "#{index + 1} of #{files.length}: Result  : '#{file}' is identical so no action taken."
          end
        rescue Exception => e
          puts "Skip file '#{file}'"
          puts "Due to the unexpected error: #{e.message}"
          next
        end
      end
      unless options[:commit]
        puts '------------------------------------------------------------------'
        puts 'This is a dry run only, to actually rename please specify --commit'
        puts '------------------------------------------------------------------'
      end
    end

    private

    def formatted_name(file, sep_string)
      meta = parse(file)
      if meta && !meta.title.blank?
        name = meta.title
        name += " by #{meta.author}"    unless meta.author.blank?
        name += " #{meta.publisher}"    unless meta.publisher.blank?
        name += " #{meta.pages} pages"  unless meta.pages.blank?

        # return the sanitized file name with full path
        [File.dirname(file),
         File::SEPARATOR,
         FilenameCleaner.sanitize_filename([name, File.extname(file)].join(''),
                                           sep_string)].join('')
      else
        # return the full path of the original file
        File.expand_path(file)
      end
    end

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
