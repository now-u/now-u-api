module V2
  module Progress
    module UserProgress
      def get_status(cause_id, request)
        return 'Authentication failed' unless request.headers['token'] && user
        
        user.joined_cause?(cause_id.to_i)
      end
    end
  end
end
