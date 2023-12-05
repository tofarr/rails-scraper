# README

A small web scraper that parses og:tags from a url and produces cards / json demonstrating their content.

## Action Log:

rails new scraper

rails generate model UrlInfo url:string:uniq title:string description:text thumbnail_url:string

Added not null for Url

Added url validator

rails db:migrate 

rails generate controller Scraper

added scraper and view

bundle add nokogiri

added load_meta method to url_info


In order to make this a full production ready project, the following is needed:

* Url canonicalization
* Url reads should be done in a background task - url_info models should have a status attribute and the controller should kick off this process and not wait too long for it to complete.
* Unit tests on the meta parsing
* Staleness calculations for urls (And the ability force a refresh)

