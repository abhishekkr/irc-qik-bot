#!/usr/bin/env ruby

require "rubygems"
require "net/http"
require "net/https"
require "uri"
require "xml-motor"

module IRC
  module WWW

    def self.google(search_terms, item_count = 1)
      http_requester("http://www.google.com/search?q=#{search_terms.split.join("+")}", "div.div.cite").first.split("<").collect{|y| y.split(">")}.collect{|z| z[1]}.join
    end

    def self.unshort(short_url)
      http_requester("http://webhoudini.appspot.com/unshort_url?url=#{short_url}", "h3.a").join
    end

    def self.whois(short_url)
      http_requester("http://whois.domaintools.com/#{short_url}", "div", "class='whois_record'").join
    end

    def self.http_requester(httpurl, node, attribs=nil)
      begin
        uri = URI.parse(httpurl)
        http = Net::HTTP.new(uri.host, uri.port)
        case httpurl[5] #checking if https is there
        when ?s then http.use_ssl = true
        else http.use_ssl = false
        end
        #http.verify_mode = OpenSSL::SSL::VERIFY_NONE if http.use_ssl
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
      rescue
        response = nil
      end
      XMLMotor.get_node_from_content response.body, node, attribs
    end
  end
end
