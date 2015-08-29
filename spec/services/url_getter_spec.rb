require 'rails_helper'

RSpec.describe UrlGetter do
  let(:getter) { described_class.new(url) }

  describe '#get' do
    context 'response' do
      let(:url) { 'http://www.google.com' }

      before do
        Excon.stub({ hostname: 'www.google.com', path: '/' }, { body: 'just google things', status: 200 })
      end

      subject { getter.get }
      specify { expect(subject).to be_a(Hash) }
      specify { expect(subject[:response_code]).to eq(200) }
      specify { expect(subject[:response_headers]).to eq({}) }
      specify { expect(subject[:response_body]).to eq('just google things') }
    end
  end
end