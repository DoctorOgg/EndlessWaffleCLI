require "EndlessWaffleCLI/version"

module EndlessWaffleCLI
  require 'rest-client'
  require 'json'
  Server=ENV['EndlessWaffleURL']

  def EndlessWaffleCLI.updateEc2Cache
    begin
      result = RestClient.get "#{EndlessWaffleCLI::Server}/ec2/update", {:accept => :json}
      JSON.parse(result.body)
    rescue => e
      raise e.response
    end
  end

  def EndlessWaffleCLI.queryEc2(query={})
    begin
      result = RestClient.post "#{EndlessWaffleCLI::Server}/ec2", { :query => query }.to_json, :content_type => :json, :accept => :json
      JSON.parse(result.body)
    rescue => e
      raise e.response
    end
  end

end
