require 'rails_helper'

RSpec.describe LoginLink, type: :class do
  subject(:link) { described_class.new(token: token, platform: platform, version: version).link }
  let(:token) { 'abc1234' }
  let(:platform) { nil }
  let(:version) { nil }

  describe '#link' do
    it 'returns default link' do
      expect(link).to eq("https://nowu.page.link/?link=https://now-u.com/loginMobile?token%3D#{token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app")
    end

    context 'when token is nil' do
      let(:token) { nil }

      it 'raise an error' do
        expect { link }.to raise_error(TokenNotPresentError)
      end
    end

    context 'when platform and version present and version 12.xxx' do
      let(:platform) { 'ios' }
      let(:version) { '12.123.23' }

      it 'returns expected link' do
        expect(link).to eq("https://nowu.page.link/?link=https://now-u.com/loginMobile?token%3D#{token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app")
      end
    end

    context 'when platform and version present and version 13.xxx' do
      let(:platform) { 'ios' }
      let(:version) { '13.123.23' }

      it 'returns expected link' do
        expect(link).to eq("com.nowu.app://loginMobile?token=#{token}")
      end
    end

    context 'when platform and version present and version 14.xxx' do
      let(:platform) { 'ios' }
      let(:version) { '14.123.23' }

      it 'returns expected link' do
        expect(link).to eq("com.nowu.app://loginMobile?token=#{token}")
      end
    end
  end
end
