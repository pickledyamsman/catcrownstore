class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases, foreign_key: :buyer_id
  has_many :crowns, through: :purchases

  def cart_count
    $redis.scard "cart#{id}"
  end

  def cart_total_price
    total_price = 0
    get_cart_crowns.each { |crown| total_price += crown.price }
    total_price
  end

  def get_cart_crowns
    cart_ids = $redis.smembers "cart#{id}"
    Crown.find(cart_ids)
  end

  def purchase_cart_crowns!
    get_cart_crowns.each { |crown| purchase(crown) }
    $redis.del "cart#{id}"
  end

  def purchase(crown)
    crowns << crown unless purchase?(crown)
  end

  def purchase?(crown)
    crowns.include?(crown)
  end

  def has_payment_info?
    braintree_customer_id
  end

  
end
