class UrlGetter
  def initialize(url, body_path)
    @url = url
    @body_path = body_path
  end

  def get
    connection = Excon.new(@url, uri_parser: Addressable::URI)

    file = File.new(@body_path, 'w')

    streamer = lambda do |chunk, remaining_bytes, total_bytes|
      file << chunk
      puts "Remaining: #{remaining_bytes.to_f / total_bytes}%"
    end

    response = connection.get(response_block: streamer)
    file.close

    {
      status: response.status,
      headers: response.headers,
      body_path: @body_path
    }
  end
end