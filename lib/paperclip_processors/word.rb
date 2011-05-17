module Paperclip
  class Word < Processor
    def initialize file, options = {}, attachment = nil
      super
      @file             = file
      # @whiny            = options[:whiny].nil? ? true : options[:whiny]
      # @format           = options[:format]
      @format   = File.extname(@file.path)
      @basename         = File.basename(@file.path, @format)
      @original_basename = attachment.original_filename
    end

    def make
      ic = Iconv.new('UTF-8', 'WINDOWS-1252')
      dst = Tempfile.new([@basename, @format].compact.join("."))
      dst.binmode
      match =  @original_basename.gsub(/\..+$/, '')

      while (line = @file.gets)
        if line.match(/#{match}_files/)
          new_line = line.gsub(/#{match}_files/, "/html_files/#{match}")
          valid_line = valid_string = ic.iconv(new_line)
          dst.write valid_line
        else
          valid_line = valid_string = ic.iconv(line)
          dst.write valid_line
        end
      end
      dst
    end
  end
end