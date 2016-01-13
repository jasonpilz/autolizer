class AutomaticService
  attr_reader :connection

  def initialize(token)
    @connection ||= Hurley::Client.new("https://api.automatic.com/")
    connection.header['Authorization'] = ("Bearer %s" % token)
  end

  def vehicles
    parse(connection.get("vehicle"))[:results]
  end

  def vehicle(id)
    parse(connection.get("vehicle/#{id}"))
  end

  def trips
    parse(connection.get("trip"))[:results]
  end

  def trip(id)
    parse(connection.get("trip/#{id}"))
  end

  def user
    parse(connection.get("user/me"))
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
