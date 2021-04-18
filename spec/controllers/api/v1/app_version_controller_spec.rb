require 'rails_helper'

RSpec.describe Api::V1::AppVersionController, type: :controller do
    describe 'check' do
        let(:last_version) { AppVersion.create(version_number: '1.1.2', compatible_with_current_api: true, release_notes: "Released")}
        let(:previous_version) { AppVersion.create(version_number: '1.1.1', compatible_with_current_api: true, release_notes: "Old, but still ok to use")}
        let(:depreciated_version) { AppVersion.create(version_number: '1.1.0', compatible_with_current_api: false, release_notes: "Depreciated")}
        let(:ok_params) { {version_number: '1.1.2'} }
        let(:still_ok_params) { {version_number: '1.1.1'} }
        let(:depreciated_params) { {version_number: '1.1.0'} }

        it 'should return status ok if version is equal with last_version' do
            post :api_v1_app_released, params: ok_params
            expect(response).to have_http_status(200)
        end
        it 'should return status ok if is a previous version but is still compatible' do
            post :api_v1_app_released, params: still_ok_params
            expect(response).to have_http_status(200)
        end
        it 'should return status 299 if version is is not compatible with api' do
            post :api_v1_app_released, params: depreciated_params
            expect(response).to have_http_status(299)
        end
    end
end
