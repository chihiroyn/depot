require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
#    assert true

#  test "positive price" do
    product = Product.new(:title       => "My Book Title",
                          :description => "yyy",
                          :image_url   => "zzz.jpg")
    product.price = -1
    assert !product.valid?
    assert_equal "should be greater than 0.01 at least", product.errors.on(:price)
    
    product.price = 0
    assert !product.valid?
    assert_equal "should be greater than 0.01 at least", product.errors.on(:price)

    product.price = 1
    assert product.valid?
#  end
  
#    test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      product = Product.new(:title       => "My Book Title",
                            :description => "yyy",
                            :price       => 1,
                            :image_url   => name)
      assert product.valid?, product.errors.full_messages
    end
    
    bad.each do |name|
      product = Product.new(:title       => "My Book Title",
                            :description => "yyy",
                            :price       => 1,
                            :image_url   => name)
      assert !product.valid?, "#{name} is saving"
    end
#    end

#    fixtures :products

#    test "unique title" do
      product = Product.new(:title       => products(:ruby_book).title,
                            :description => "yyy",
                            :price       => 1,
                            :image_url   => "fred.gif")
      assert !product.save
      assert_equal "has already been taken", product.errors.on(:title)
=begin
      assert_equal I18n.translate('activerecord.errors.messages.taken'),
                   product.errors.on(:title)
=end
#    end
  end
  
#  test "invalid with empty attributes" do
#  test "invalid_with_empty_attributes" do
# ↑ なぜだか「unknown command ?i (ArgumentError)」で、どうしても通らない。
# 文字コードや改行コードを色々変えてもダメ
  def test_product
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
    assert product.errors.invalid?(:image_url)
  end
  
#  test "positive price" do
# ここに書くと実行されない
#  end
end
