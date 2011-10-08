class Menu < ActiveRecord::Base

	scope :children, lambda {|menu_id| where(["menus.parent = #{menu_id}"])}

	#scope :children, where("menus.parent = ")

end
