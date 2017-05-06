module CurrentUserConcern
  extend ActiveSupport::Concern


 def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User", 
                   first_name: "GUEST", 
                   last_name: "USER", 
                   email: "guest@example.com")
  end
end