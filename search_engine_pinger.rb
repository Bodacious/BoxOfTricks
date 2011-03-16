# this observer notifies search engines when the sitemap has been updated
class SearchEnginePinger < ActiveRecord::Observer

  require 'net/http'
  require 'uri'
  
  # add the name of the model(s) we're observing here
  observe :my_model
  
  # Base domains for search engines
  BASE_DOMAINS = {
    :bing   => "www.bing.com",
    :google => "www.google.com",
    :yahoo  => "search.yahooapis.com",
    :ask    => "submissions.ask.com"
  }
  ASK_PATH    = "/ping?sitemap="
  YAHOO_PATH  = "/SiteExplorerService/V1/updateNotification?url="
  GOOGLE_PATH = "/webmasters/sitemaps/ping?sitemap="
  BING_PATH   = "/webmaster/ping.aspx?siteMap="

  
  
  class << self
    include Rails.application.routes.url_helpers
    
    def escaped_sitemap_url
      @escaped_sitemap_url ||= URI.escape(sitemap_url(:format => :xml, :host => APP_CONFIG[:host]))
    end
    
  end

  def after_save(instance)
    @instance = instance
    ping_search_engines if observed_attributes_changed?
  end
  

  private
  
  def observed_attributes_changed?
    !!@instance.class.sep_observe_attributes.detect { |att| @instance.changes[att] }
  end
    
  def ping_search_engines
    BASE_DOMAINS.each do |key,value|
      if Rails.env == "production"
        response = Net::HTTP.get(value, const_get("#{key.to_s.upcase}_PATH") + self.class.escaped_sitemap_url)
        Rails.logger.info("[Search Engine Pinger]Pinged #{key.to_s} in #{Rails.env} mode")
        Rails.logger.info("[Search Engine Pinger]Response: #{response.inspect}")
      else
        Rails.logger.info("[Search Engine Pinger]Pretending to ping #{key.to_s} in #{Rails.env} mode")
      end
    end    
  end
  
end