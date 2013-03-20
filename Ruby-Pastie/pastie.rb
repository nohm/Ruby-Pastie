require 'optparse'
require_relative 'color'
require_relative 'paste'
require_relative 'history'
require_relative 'language'

# Default options
options = {
    :private => true,
    :language => "plain" }

# Parses options
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: pastie.rb [options] file1 file2 ... fileN"
  opts.on("-p", "--public", "Make a public Pastie") { options[:private] = false }
  opts.on("-l", "--lang [lang]", Pastie.langs, Pastie.lang_alias, "Select text language", "  (#{Pastie.lang_list})") { |lang| options[:language] = lang }
  opts.on_tail("-h", "--help", "Show help") { puts opts; exit }
  opts.on_tail("-i", "--history", "Show history") { History.print; exit }
  opts.on_tail("-c", "--clear", "Clear history") {History.clear; puts "History cleared".green; exit}
end

# Main
begin
  optparse.parse!
   
  unless ARGV.empty?
    ARGV.each do |f|
      path = File.expand_path(f)
      if File.exists?(path)
        response = Pastie.create(File.read(path), options[:private], options[:language])
        unless response.nil?
          History.append(f, response)
          puts response.green
        else
          puts "Error: Cant create paste at this moment.".red
        end
      else
        puts "Error: \"#{path}\" does not exist!".red
      end
    end
    
    ARGV.clear
  else
    puts optparse
  end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts optparse
  exit
rescue SocketError
  puts "Error: Connection refused.".red
  exit
end