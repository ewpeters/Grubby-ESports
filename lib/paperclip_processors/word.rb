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
      match.gsub!('_', ' ')
      puts "processing 1"
      puts match
      spaces_gone = match.gsub(' ', '_')
      puts spaces_gone
      while (line = @file.gets)
        temp_line = CGI::unescape(line)
        if temp_line.match(/#{match}_files/)
          puts "Temp Line: #{temp_line}"
          new_line = temp_line.gsub(/#{match}_files/, "/html_files/#{spaces_gone}")
          valid_line = ic.iconv(new_line)
          dst.write valid_line
        else
          valid_line = ic.iconv(line)
          dst.write valid_line
        end
      end
      dst
    end
  end
end