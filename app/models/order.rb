class Order < ActiveRecord::Base
  has_many :line_items
  
  PAYMENT_TYPES = [
    # 表示されるもの      DB内で格納されるもの
    [ "現金",             "check" ],
    [ "クレジットカード", "cc" ],
    [ "注文書",           "po" ]
  ]
end
