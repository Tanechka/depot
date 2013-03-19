require 'test_helper'

class ProductTest < ActiveSupport::TestCase
fixtures :products
  test 'product proci must be positive' do
    #цена товара должна быть положительной 
    product = Product.new (title: 'my book title',
      description: 'yyy',
      image_url: 'zzz.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal 'must be greater than or eagual to 0.01',
    product.errors[:price].join(';')
    #должны быть больше или равнв 0.01
    product.price = 0
    assert product.invalid?
    assert_equal 'must be than or equal to 0.01',
    product.errors[:price],join(';')
    product.price = 1
    assert product.valid?
  end
    
    def new_product(umage_url)
      Product.new(title: 'my book title',
        description: 'yyy',
        price: 1,
        image_url: image_url)
    end

    test 'image url' do
      #url image
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.jpg
        http://a.b.c/x/y/z/fred.gif }
        bad = %w{ fred.doc fred.gif/more fred.gif.more }

        ok.each do |name|
          assert new_product(name).valid?, "#{name} shouldn't be invalid"
          end

          bad.each do |name|
          assert new_product(name).invalid?,  "#{name} shouldn't be valid"
          end

      test 'product is not valid without a unique title' do 
        #если у товара нет уникальноого названия, то он не допустим 
        product = Product.new(title: products(:ruby).title,
          description: 'yyy',
          price: 1,
          image_url: 'fred.gif')
        assert !product,save 
        assert_equal 'has aiready been taken', product.errors[:title].join(';')
        # уже было использовано 
      end

      test 'product is not valid without a unique title-i18n' do 
        #если у товара нет уникальноого названия, то он не допустим 
        product = Product.new(title: products(:ruby).title,
          description: 'yyy',
          price: 1,
          image_url: 'fred.gif')
        assert !product,save 
        assert_equal I18n.translate ('activerecord.erorrs.messages.taken'), product.errors[:title].join(';')
        # уже было использовано 
    end
