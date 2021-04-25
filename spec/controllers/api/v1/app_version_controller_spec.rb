require 'rails_helper'

RSpec.describe Api::V1::AppVersionController, type: :controller do
    describe 'check' do
        last_version = AppVersion.create!(version_number: '1.1.2', compatible_with_current_api: true, release_notes: "Released")
        previous_version = AppVersion.create!(version_number: '1.1.1', compatible_with_current_api: true, release_notes: "Old, but still ok to use")
        depreciated_version = AppVersion.create!(version_number: '1.1.0', compatible_with_current_api: false, release_notes: "Depreciated")
        ok_params = {version_number: '1.1.2'}
        still_ok_params = {version_number: '1.1.1'}
        depreciated_params = {version_number: '1.1.0'}

        before do 
            depreciated_version
            previous_version
            last_version
            ok_params
            still_ok_params
            depreciated_params
        end

        it 'should return status ok if version is equal with last_version' do
            post :check, params: ok_params
            expect(response).to have_http_status(200)
        end
        it 'should return status ok if is a previous version but is still compatible' do
            post :check, params: still_ok_params
            expect(response).to have_http_status(200)
        end
        it 'should return status 299 if version is is not compatible with api' do
            post :check, params: depreciated_params
            expect(response).to have_http_status(299)
        end
    end
end
