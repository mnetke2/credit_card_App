# Rest client used to fetch full contact service API
#
# @params[String] User email
# @returns[JSON] Response Json

require "json"
class FullContactService
  def initialize(email)
    @email = email
  end

  def call
    fetch
  end

  private

  def fetch
    # response = RestClient.get url
    # JSON.parse(response)

    response = JSON.parse(File.read('lib/full_contact_response.json'))
    response.deep_symbolize_keys
  end

  def url
    # "https://api.fullcontact.com/v2/person.json?X-FullContact-APIKey=#{api_key}&email=#{@email}"
  end

  # hardcoded for now, can fetch this from configs depending upon the envs.
  def api_key
    # 'uA6TuVzTHWADhBuZYaRND38YTsLgFihx'
  end
end
