module V2
  module Progress
    module UserProgress
      def get_status(cause_id, request)
        return false unless user
        user.joined_cause?(cause_id.to_i)
      end
    end
  end
end
