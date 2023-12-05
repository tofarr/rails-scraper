require 'uri'

class UrlInfo < ApplicationRecord
    validates :url, presence: true, url: true
    validates :thumbnail_url, url: true
end
