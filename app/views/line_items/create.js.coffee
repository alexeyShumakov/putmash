$ ->
  $('.go-to-cart-btn').remove()
  $('.to-cart-btn').show()
  $('#product-qty').html('<%= @cart.total_quantity %>')
  btn = $('#<%= @product.id %>-cart-btn')
  btn.parent().append('<%= render 'line_items/to_cart' %>')
  btn.hide()
