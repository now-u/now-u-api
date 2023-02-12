module V2
  module Image
    module ImageService
      def get_image_path(image)
        if Rails.env.development?
          ActiveStorage::Blob.service.path_for(image.key)
        elsif Rails.env.production?
          image.service_url
        else
          "Rails environment could not be determined"
        end
      end
    end
  end
end
