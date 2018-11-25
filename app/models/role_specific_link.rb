class RoleSpecificLink < ApplicationRecord
    enum role_id: [:user, :vip, :admin, :void]
    belongs_to :user
end
