require "EndlessWaffleCLI/version"

module EndlessWaffleCLI
  require 'rest-client'
  require 'json'
  @@server=nil

  def self.setServer(server)
    @@server = server
  end

  def self.setToken(token)
    @@token = token
  end

  def self.updateEc2Cache
    begin
      result = RestClient.get "#{@@server}/ec2/update", :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.queryEc2(query={})
    begin
      result = RestClient.post "#{@@server}/ec2", { :query => query }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.getToken(username,password)
    begin
      result = RestClient::Request.execute method: :get, url: "#{@@server}/token/get", user: username, password: password
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.resetToken(username,password)
    begin
      result = RestClient::Request.execute method: :get, url: "#{@@server}/token/reset", user: username, password: password
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

end
