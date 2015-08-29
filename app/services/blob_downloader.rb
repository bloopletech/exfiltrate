class BlobDownloader
  def initialize(blob)
    @blob = blob
  end

  def download
    connection = Excon.new(@blob.url, uri_parser: Addressable::URI)

    file = Tempfile.new('exfiltrate')
    streamer = lambda { |chunk, remaining_bytes, total_bytes| file << chunk }

    response = connection.get(response_block: streamer)

    file.rewind

    @blob.update!(
      response_code: response.status,
      response_headers: response.headers,
      response_body: file
    )
    @blob.request!
  ensure
    if file
      file.close
      file.unlink
    end
  end
end