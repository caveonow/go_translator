require "go_translator/version"
require "go_translator/constants"
require "net/http"
require "uri"

module GoTranslator
  def self.translate(text, options = {})
    options = default_options.merge(options)
    uri = URI.parse(URI.encode("#{GOOGLE_TRANSLATE_URL}/single?client=z&sl=#{options[:from]}&tl=#{options[:to]}&ie=#{options[:in_encoding]}&oe=#{options[:out_encoding]}&dt=t&dt=rm&q=#{text}"))
    response = Net::HTTP.get(uri)
    response.nil? || response.empty? ? '' : response.split(SPLITTER)[0].gsub(/[\[|\"]/, '')
  rescue
    ''
  end

  def self.default_options
    {
      from: DEFAULT_FROM,
      to: DEFAULT_TO,
      in_encoding: DEFAULT_IN_ENCODING,
      out_encoding: DEFAULT_OUT_ENCODING
    }
  end
end
