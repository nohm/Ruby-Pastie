# Pastes and returns response
require 'net/http'
require_relative 'language'

module Pastie
  # Create a new pastie
  def self.create(body, private, language)    
    # TODO: determine language from file for paste[parser_id]
    post_data = {
      "paste[body]" => body,
      "paste[authorization]" => "burger",
      "paste[restricted]" => private ? "1" : "0",
      "paste[parser_id]" => parser_id(language)
    }
    
    response = Post::to(post_url, post_data)
    if response.kind_of?(Net::HTTPFound)
      response['location']
    else
      nil
    end
  end
  
  # Parse the post_url
  def self.post_url
    URI.parse("http://pastie.org/pastes")
  end
end

module Post
  # Posts data to url
  def self.to(url, data)
    Net::HTTP.post_form(url, data)
  end
end