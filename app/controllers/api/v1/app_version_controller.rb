class Api::V1::AppVersionController < ApplicationController
    def check
        last_version = AppVersion.all.last
        version = AppVersion.find_by(version_number: params[:version_number])

        if version.version_number == last_version.version_number 
            render json: {}, status: :ok
        elsif version.compatible_with_current_api && version.version_number != last_version.version_number
            render :text => 'UPDATE AVAILABLE', status: :ok
        elsif !version.compatible_with_current_api && version.version_number != last_version.version_number
            render :test  => 'DEPRECIATED', :status => 299
        end
    end
end
