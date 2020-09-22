class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :prefecture, :city, :address, :building, :tel, :item_id, :user_id, :token

  validates :postal, :prefecture, :city, :address, :tel, :token, presence: true
  validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/ }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    # 配送先を保存
    Address.create(postal: postal, prefecture: prefecture, city: city, address: address, 
    building: building, tel: tel, order_id: order.id)

  end
end