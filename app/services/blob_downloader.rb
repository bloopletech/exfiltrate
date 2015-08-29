require 'digest/sha1'

class BlobDownloader
  def initialize(blob)
    @blob = blob
  end

  def download
    response = UrlGetter.new(@blob.url, body_path).get

    @blob.update!(
      response_code: response[:status],
      response_headers: response[:headers],
      response_body_path: response[:body_path]
    )

    @blob.request!
  end

  def body_path
    @blob.site.path + 'blobs' + Digest::SHA1.hexdigest(@blob.url)
  end
end