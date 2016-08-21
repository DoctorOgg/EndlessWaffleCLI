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

  def self.updateSubnets
    begin
      result = RestClient.get "#{@@server}/subnets/update", :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.querySubnets(query={})
    begin
      result = RestClient.post "#{@@server}/subnets/show", { :query => query }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.updateAmi
    begin
      result = RestClient.get "#{@@server}/ami/update", :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.queryAmi(query={})
    begin
      result = RestClient.post "#{@@server}/ami/show", { :query => query }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.updateSecurityGroups
    begin
      result = RestClient.get "#{@@server}/securitygroups/update", :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.querySecurityGroups(query={})
    begin
      result = RestClient.post "#{@@server}/securitygroups/show", { :query => query }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end


  def self.listRoles(query={})
    begin
      result = RestClient.post "#{@@server}/role/list", { :query => query }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.showRole(name)
    begin
      result = RestClient.post "#{@@server}/role/show", { :name => name }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.createRole(name)
    query = {"name" => name}
    begin
      result = RestClient.post "#{@@server}/role/create", query.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.deleteRole(name)
    query = {"name" => name}
    begin
      result = RestClient.post "#{@@server}/role/delete", query.to_json, :content_type => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.updateRole(data)
    begin
      result = RestClient.post "#{@@server}/role/update", data.to_json, :content_type => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.listCommand(query={})
    begin
      result = RestClient.post "#{@@server}/commands/list", { :query => query }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.showCommand(name)
    begin
      result = RestClient.post "#{@@server}/commands/show", { :name => name }.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.createCommand(name)
    query = {"name" => name}
    begin
      result = RestClient.post "#{@@server}/commands/create", query.to_json, :content_type => :json, :accept => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.deleteCommand(name)
    query = {"name" => name}
    begin
      result = RestClient.post "#{@@server}/commands/delete", query.to_json, :content_type => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

  def self.updateCommand(data)
    begin
      result = RestClient.post "#{@@server}/commands/update", data.to_json, :content_type => :json, :Authorization => "Token token=\"#{@@token}\""
      JSON.parse(result.body)
    rescue => e
      raise e
    end
  end

end
