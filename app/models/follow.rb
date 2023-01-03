class Follow < ApplicationRecord
    belongs_to :user
    def new_follow(u_id, f_u_id)
        @follow = Follow.new(user_id: u_id, follow_user_id: f_u_id)
    end
end
