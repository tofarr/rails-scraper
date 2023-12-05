require 'uri'
require 'net/http'
require 'nokogiri'

class UrlInfo < ApplicationRecord
    validates :url, presence: true, url: true
    validates :thumbnail_url, url: true

    def load_meta
        uri = URI(url)
        #TODO: Specify a timeout here (Otherwise we'll have to move this into a background task)
        res = Net::HTTP.get_response(uri)
        if not res.is_a?(Net::HTTPSuccess)
            return false
        end
        doc = Nokogiri::HTML(res.body)
        parse_meta(doc)
        true
    end

    def parse_meta(doc)
        self.title = doc.css('title').first&.inner_html
        doc.css('meta').each do |meta|
            case meta["property"]
            when "og:title"
                self.title = meta["content"]
            when "description"
                self.description = meta["content"]
            when "og:description"
                self.description = meta["content"]
            when "og:image"
                self.thumbnail_url = meta["content"]
            else
            end
        end
    end
end
