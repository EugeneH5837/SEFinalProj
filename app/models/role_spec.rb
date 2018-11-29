class RoleSpec < ApplicationRecord
    enum role_id: [:student, :assistant, :teacher, :principal, :admin, :void ]
    belongs_to :user, :optional => true
    after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role_id ||= :student
  end
end
