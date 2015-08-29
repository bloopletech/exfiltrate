require 'rails_helper'

RSpec.describe BlobDownloader do
  let(:downloader) { described_class.new(blob) }

  describe '#download' do
    let(:blob) { Blob.new(url: 'http://www.google.com') }

    before do
      Excon.stub({ hostname: 'www.google.com', path: '/' }, { body: 'just google things', status: 200 })
    end

    before { downloader.download }
    specify { expect(blob.aasm_state).to eq('requested') }
    specify { expect(blob.response_code).to eq(200) }
    specify { expect(blob.response_headers).to eq({}) }
    specify { expect(blob.response_body.read).to eq('just google things') }
  end
end