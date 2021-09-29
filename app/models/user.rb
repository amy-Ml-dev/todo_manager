class User < ActiveRecord::Base
  def to_pleasent_string
    "Username is: #{name} email: #{email} password: #{password}"
  end
end
