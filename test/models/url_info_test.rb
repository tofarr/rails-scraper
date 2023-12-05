require "test_helper"

class UrlInfoTest < ActiveSupport::TestCase
  test "url must be present" do
    url_info = UrlInfo.new
    assert_not(url_info.save, "Saved a UrlInfo without a url")
  end

  test "only url is required" do
    url_info = UrlInfo.new(url: "https://foobar.com")
    assert(url_info.save, "UrlInfo with a url failed to save")
  end

  test "url must be a url" do
    url_info = UrlInfo.create(url: "not a valid url")
    assert url_info.errors.present?, "Saved a UrlInfo with an invalid Url"
  end

  test "thumbnail_url must be a url" do
    url_info = UrlInfo.create(url: "https://foobar.com", thumbnail_url: "not a valid url")
    assert url_info.errors.present?, "Saved a UrlInfo with an invalid Thumbnail Url"
  end

  #TODO: Tests for scraper here - precedence is og tags first, then title, description...
end
