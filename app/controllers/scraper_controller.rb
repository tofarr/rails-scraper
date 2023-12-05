
class ScraperController < ApplicationController

    def index
    end

    def scrape
        url = params.require(:url)
        @url_info = UrlInfo.find_by_url(url)
        if @url_info.blank?
            @url_info = UrlInfo.new(url: url)
            @url_info.load_meta
            @url_info.save
        end
    end
end
