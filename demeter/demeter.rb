class Invoice < ActiveRecord::Base
  belongs_to :user
end

# <%= @invoice.user.name %>
# <%= @invoice.user.address %>
# <%= @invoice.user.cellphone %>

class Invoice < ActiveRecord::Base
  belongs_to :user
  delegate :name, :address, :cellphone, :to => :user, :prefix => true
end

# <%= @invoice.user_name %>
# <%= @invoice.user_address %>
# <%= @invoice.user_cellphone %>