$ ->
  line_item = '#line_item_' + '<%= @line_item.id %>'

  $(line_item).find('.total-price').html('<%= number_to_currency(@line_item.total_price) %>')
  $(line_item).find('.qty_form').val('<%= @line_item.quantity %>')
  $('#product-qty').html('<%= @cart.total_quantity %>')
  $('.cart-total-price').children('i').html('<%= number_to_currency(@cart.total_price) %>')