require "go_translator/version"
require "net/http"
require "uri"

module GoTranslator
  GOOGLE_TRANSLATE_URL = 'https://translate.google.com/translate_a'
  DEFAULT_FROM = 'en'
  DEFAULT_TO = 'vi'
  SPLITTER = ','

  def self.translate(text, options = {})
    options = { from: DEFAULT_FROM, to: DEFAULT_TO }.merge(options)
    uri = URI.parse("#{GOOGLE_TRANSLATE_URL}/single?client=z&sl=#{options[:from]}&tl=#{options[:to]}&ie=UTF-8&oe=UTF-8&dt=t&dt=rm&q=#{text}")
    response = Net::HTTP.get(uri)
    response.nil? || response.empty? ? '' : response.split(SPLITTER)[0].gsub(/[\[|\"]/, '')
  rescue
    ''
  end
end
