require 'httparty'
require 'json'

# Parse news from  country, which you set
class ApiParser
  include HTTParty
  attr_reader :parsed_news
  attr_accessor :country

  API_KEY = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
  base_uri 'https://newsapi.org/v2/'

  def initialize(country = 'us', file_name = 'news', keyword = '',
                 category = '')
    @country = country
    @file_name = file_name
    @keyword = keyword
    @category = category
  end

  def self.top_headlines(country, file_name)
    new(country, file_name).top_headlines
  end

  def top_headlines
    query = { query: { country: @country, apiKey: API_KEY } }
    @parsed_news = self.class.get('/top-headlines', query).parsed_response
    self
  end

  def everything
    query = { query: { q: @keyword, apiKey: API_KEY, category: @category } }
    @parsed_news = self.class.get('/top-headlines', query).parsed_response
    self
  end

  def pretty_show
    puts JSON.pretty_generate(@parsed_news)
  end

  def save_to_file
    if File.exist?("#{@file_name}.json")
      File.open("#{@file_name}.json", 'a') do |file|
        file.write "\n"
        file.puts @parsed_news
      end
    else
      File.write("#{@file_name}.json", @parsed_news)
    end
  end

  def exist?
    %w[us ar ua].include?(@country)
  end
end

ApiParser.top_headlines('ar', 'news_from_ar')
ApiParser.new('us', 'my', 'Goal', 'sport').everything
