## EbooksRenamer

[![Gem Version](https://badge.fury.io/rb/ebooks_renamer.svg)](http://badge.fury.io/rb/ebooks_renamer)
[![Dependency Status](https://gemnasium.com/agilecreativity/ebooks_renamer.png)](https://gemnasium.com/agilecreativity/ebooks_renamer)
[![Code Climate](https://codeclimate.com/github/agilecreativity/ebooks_renamer.png)](https://codeclimate.com/github/agilecreativity/ebooks_renamer)
[![Endorse](https://api.coderwall.com/agilecreativity/endorsecount.png)](https://coderwall.com/agilecreativity)

Rename multiple ebook files using the power of ruby.
This is the alternate version of my [ebook_renamer][] gem that implemented in
pure ruby using the power of other gems for metadata extraction.

The original [ebook_renamer][] gem requires the [Calibre Meta][] to be installed,
but this gem does not need any third party software to be installed.

### Features

- Rename multiple ebooks at once currently `epub`, `mobi` and `pdf` are supported.

- Use of the following information as part of the file

  * title  - common for (epub, pdf, mobi)
  * author - common for (epub, pdf, mobi)
  * total pages - currently only pdf file will have this metadata information
  * publisher   - common for (mobi, epub)

The output file will be something like (if all of the metadata are available)

```
# if '_' is the `--sep-string` is '_'
<title>_by_<author>_<publisher>_<total_pages>_pages.extension

# The minimal possible final file name will be
<title>.extension
```

If the title is not available then no action will be performed.

- Use feature of other ruby gems to extract metadata
  * [pdf-reader][] gem to extract pdf metadata
  * [mobi][] gem to extract mobi metadata
  * [epubinfo][] gem to extract epub metadat

- Sanitized file name if the metadata contain invalid/special characters.

- If the metadata is not available then the rename will not be performed

- If the result name is the same as the original name then no rename is performed.

### Installation

Or install it yourself as:

    $ gem install ebooks_renamer

### Usage
- For help and usage just type `ebooks_renamer` without any options

```
Usage:
  ebooks_renamer rename

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -n, [--inc-words=one two three]          # List of words to be included in the result if any
  -x, [--exc-words=one two three]          # List of words to be excluded from the result if any
  -i, [--ignore-case], [--no-ignore-case]  # Match case insensitively
                                           # Default: true
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information
  -s, [--sep-string=SEP_STRING]            # Separator string between words in filename
                                           # Default: .
  -c, [--commit], [--no-commit]            # Make change permanent

Rename ebooks based on given criteria
```

### Usage Example:

Here is your typical usage of the gem

```shell
# change to the directory that contain your ebook files
cd ~/Dropbox/ebooks

# set version of your ruby
rbenv local 2.1.1 # if you are using rbenv as your ruby manager

# install the gem
gem install ebooks_renamer

# run the command without making any changes
ebooks_renamer rename --base-dir . --recursive

# If you are happy with what will be changed then you can make your change permanent

ebooks_renamer rename --base-dir . --recursive --commit

# To change the default separator string `sep_string` (default to '.' - dot string)
# e.g. this will use the '_' (underscore) to separate each word in the output
ebooks_renamer rename --base-dir . --sep-string '_' --recursive --commit

# To only include/exclude certain files in the result you can use the
# `--exc-words` or `--exc-words` etc
# e.g. The following will perform the rename only on the files that contain the word 'android' or 'iphone'
# in the title.

ebooks_renamer rename --base-dir . --sep-string '-' --recursive --inc-words android iphone --commit
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[ebook_renamer]: https://github.com/agilecreativity/filename_cleaner
[mobi]: https://rubygems.org/gems/mobi
[pdf-reader]: https://rubygems.org/gems/pdf-reader
[epubinfo]: https://rubygems.org/gems/epubinfo
[Calibre Meta]: http://manual.calibre-ebook.com/cli/ebook-meta.html
