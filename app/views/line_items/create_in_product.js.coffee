$ ->
  $('.product-to-cart').parent().append('<%= render 'line_items/product_to_cart' %>')
  $('.product-to-cart').hide()
