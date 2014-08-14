require "thor"
require "agile_utils"
require_relative "ebooks_renamer"
module EbooksRenamer
  class CLI < Thor
    desc "rename", "Rename ebooks based on given criteria"
    method_option *AgileUtils::Options::BASE_DIR
    method_option *AgileUtils::Options::RECURSIVE
    method_option *AgileUtils::Options::VERSION
    method_option :sep_string,
                  aliases: "-s",
                  desc: "Separator string between words in filename",
                  default: "."
    method_option :commit,
                  aliases: "-c",
                  desc: "Make change permanent",
                  type: :boolean,
                  default: false
    def rename
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using EbooksRenamer version #{EbooksRenamer::VERSION}"
        exit
      end
      # Add the default supported extensions
      opts.merge!(exts: %w[pdf epub mobi])
      puts "Your options #{opts}"
      EbooksRenamer.rename(opts)
    end

    desc "usage", "Display help screen"
    def usage
      puts <<-EOS

Usage:
  ebooks_renamer

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information
  -s, [--sep-string=SEP_STRING]            # Separator string between words in filename
                                           # Default: .
  -c, [--commit], [--no-commit]            # Make change permanent

Rename ebooks based on given criteria
      EOS
    end

    default_task :usage
  end
end
