class RoleSpec < ApplicationRecord
    enum role_id: [:user, :vip, :admin, :void]
    belongs_to :user, :optional => true
    after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role_id ||= :user
  end
end
