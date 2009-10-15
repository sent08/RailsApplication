class AnonymousUser < Employee
  def save
    false
  end

  def logged_in?
    false
  end

  def logged_out?
    true
  end
end