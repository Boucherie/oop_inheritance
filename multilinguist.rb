require 'httparty'
require 'json'


# This class represents a world traveller who knows what languages are spoken in each country
# around the world and can cobble together a sentence in most of them (but not very well)
class Multilinguist

  TRANSLTR_BASE_URL = "http://www.transltr.org/api/translate"
  COUNTRIES_BASE_URL = "https://restcountries.eu/rest/v2/name"
  #{name}?fullText=true
  #?text=The%20total%20is%2020485&to=ja&from=en


  # Initializes the multilinguist's @current_lang to 'en'
  #
  # @return [Multilinguist] A new instance of Multilinguist
  def initialize
    @current_lang = 'en'
  end

  # Uses the RestCountries API to look up one of the languages
  # spoken in a given country
  #
  # @param country_name [String] The full name of a country
  # @return [String] A 2 letter iso639_1 language code
  def language_in(country_name)
    params = {query: {fullText: 'true'}}
    response = HTTParty.get("#{COUNTRIES_BASE_URL}/#{country_name}", params)
    json_response = JSON.parse(response.body)
    json_response.first['languages'].first['iso639_1']
  end

  # Sets @current_lang to one of the languages spoken
  # in a given country
  #
  # @param country_name [String] The full name of a country
  # @return [String] The new value of @current_lang as a 2 letter iso639_1 code
  def travel_to(country_name)
    local_lang = language_in(country_name)
    @current_lang = local_lang
  end

  # (Roughly) translates msg into @current_lang using the Transltr API
  #
  # @param msg [String] A message to be translated
  # @return [String] A rough translation of msg
  def say_in_local_language(msg)
    params = {query: {text: msg, to: @current_lang, from: 'en'}}
    response = HTTParty.get(TRANSLTR_BASE_URL, params)
    json_response = JSON.parse(response.body)
    json_response['translationText']
  end
end

class MathGenius < Multilinguist

  def report_total(value)
    total = 0
    value.each do |number| 
      total += number
    end 
    say_in_local_language("The total is #{total}") 
  end
end

class QuoteCollector < Multilinguist

attr_reader :quote_collection

  def initialize
    @quote_collection = []
  end

  def add_quote(quote)
    value = quote
    quote_collection << value
    quote_collection
  end

  def koan_time
    perform = quote_collection.sample 
    say_in_local_language("#{perform}")
  end

end


me = MathGenius.new
you = QuoteCollector.new


puts me.report_total([1,1,2,3,5,8,13,21])

me.travel_to("Japan")

puts me.report_total([1,11,111,1111])

me.travel_to("China")

puts me.report_total([1,11,111,1111])

you.add_quote("The truth is not for all men but only for those who seek it.")
you.add_quote("No person is your friend who demands your silence, or denies your right to grow.")
you.add_quote("Happiness is part of who we are. Joy is the feeling")
you.add_quote("Freedom is what we do with what is done to us.")
puts you.travel_to("France")
puts you.koan_time

puts you.travel_to("Denmark")
puts you.koan_time

puts you.travel_to("Italy")
puts you.koan_time
