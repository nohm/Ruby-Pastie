# Keeps history in check
require 'date'

module History
  # Location od the history file
  def self.location
    File.dirname($0).tr("/","\\") + "\\history.txt"
  end
  
  # Append a new link to the history
  def self.append(name, link)
    File.open(location, 'a') { |file| file.puts "#{Time.now}~/~#{name}~/~#{link}" }
  end
  
  # Clear the history
  def self.clear
    File.open(location, 'w') {} # Doing nothing apparently clears it.
  end
  
  # Print the history
  def self.print
    lines = IO.readlines(location)
    puts "Pastie History"
    puts "#{lines.size} entries"
    puts "=============================="
    lines.each do |line|
      line_a = line.split("~/~")
      puts "Created at: #{line_a[0]}"
      puts "From file:  #{line_a[1]}"
      puts "URL:        #{line_a[2]}"
      if lines.index(line) + 1 < lines.size; puts "---"; end
    end
    puts "=============================="
  end
end