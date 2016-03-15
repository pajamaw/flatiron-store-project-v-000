class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    total=0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(new_item_id)
    if @line_item = self.line_items.find_by(item_id: new_item_id)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new(cart_id: self.id, item_id: new_item_id)
    end 
    @line_item 
  end


end