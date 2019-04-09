require 'httparty'
require 'json'

# Parse news from  country, which you set

class ApiParser
  include HTTParty

  API_KEY = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
  base_uri 'https://newsapi.org/v2/'

  def initialize( country, file_name = 'news' )
    @options = { query: { country: country, apiKey: API_KEY}}
    @file_name = file_name
  end

  def self.top_headlines(country, file_name)
      new(country,file_name )
      self.class.get( "/top-headlines",@options).parsed_response
     #pretty_show(parsed_api_page)
     #save_to_file(parsed_api_page)
  end

  private

  def pretty_show(parsed_api_page)
    puts JSON.pretty_generate(parsed_api_page)
  end

  def save_to_file(parsed_api_page)
    if File.exist?("#{@file_name}.json")
      File.open("#{@file_name}.json", "a")  do |file|
        file.write "\n"
        file.puts parsed_api_page
      end
    else
      File.write("#{@file_name}.json", parsed_api_page)
    end
  end
end

#ApiParser.top_headlines('ar')
ApiParser.top_headlines('ar', "news")




