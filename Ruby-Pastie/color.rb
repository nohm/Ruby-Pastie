# Handles coloring strings

class String
  def colorize(text, color_code)
    "#{color_code}#{text}\e[0m"
  end
  
  def red;        colorize(self, "\e[1m\e[31m"); end
  def green;      colorize(self, "\e[1m\e[32m"); end
  def dark_green; colorize(self, "\e[32m");      end
  def yellow;     colorize(self, "\e[1m\e[33m"); end
  def blue;       colorize(self, "\e[1m\e[34m"); end
  def dark_blue;  colorize(self, "\e[34m");      end
  def purple;     colorize(self, "\e[1m\e[35m"); end
  def magenta;    colorize(self, "\e[1m\e[36m"); end
end