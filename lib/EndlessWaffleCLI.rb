require "EndlessWaffleCLI/version"

module EndlessWaffleCLI
  require 'rest-client'
  require 'json'
  @@server=nil

  def self.setServer(server)
    @@server = server
  end

  def self.updateEc2Cache
    begin
      result = RestClient.get "#{@@server}/ec2/update", {:accept => :json}
      JSON.parse(result.body)
    rescue => e
      raise e.response
    end
  end

  def self.queryEc2(query={})
    begin
      result = RestClient.post "#{@@server}/ec2", { :query => query }.to_json, :content_type => :json, :accept => :json
      JSON.parse(result.body)
    rescue => e
      raise e.response
    end
  end

end
