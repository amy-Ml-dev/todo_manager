class User < ActiveRecord::Base
  def to_pleasent_string
    "#{name} #{email} #{password}"
  end
end
