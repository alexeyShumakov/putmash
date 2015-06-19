$ ->
  unless <%= @cart.line_items.any? %>
    $('.my-cart').html('<%= render "carts/empty_cart" %>')
  else
    line_item = '#line_item_' + '<%= @line_item.id %>'
    $(line_item).remove()
    $('.cart-total-price').children('i').html('<%= number_to_currency(@cart.total_price) %>')
  $('#product-qty').html('<%= @cart.total_quantity %>')
