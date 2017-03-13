require 'rubygems'
require 'nokogiri'
require 'open-uri'

# downloads html document by link
class Document
  def parse(url)
    @url = URI.parse(url).scheme.nil? ? "http://#{url}" : url
    @doc = Nokogiri::HTML(open(@url))
  end
end

# puts document links
class Link < Document
  def parse(url = 'nokogiri.org/tutorials/installing_nokogiri.html')
    super url
    @doc.css('a').each { |row| puts link_correct(row['href']) }
  end

  private def link_correct(link)
    if link.start_with?('//')
      "http:#{link}"
    elsif link.start_with?('/')
      "#{URI.parse(@url).scheme}://#{URI.parse(@url).host}#{link}"
    elsif link.start_with?('#')
      "#{@url}#{link}"
    else
      link
    end
  end
end

# puts document headers
class Header < Document
  def parse(url = 'nokogiri.org/tutorials/installing_nokogiri.html')
    super url
    @doc.css('h1', 'h2').each { |header| puts header.text.strip }
  end
end
