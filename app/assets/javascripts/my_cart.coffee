ready = ->
  $ ->
    $('.plus').click ->
      quantity_node = $(this).siblings('.line_item_quantity').children('.quantity')
      count = parseInt(quantity_node.val(), 10)
      if count < 1
        quantity_node.val(1)
      else
        quantity_node.val(count + 1)

    $('.minus').click ->
      quantity_node = $(this).siblings('.line_item_quantity').children('.quantity')
      count = parseInt(quantity_node.val(), 10)
      if count <= 2
        quantity_node.val(1)
      else
        quantity_node.val(count - 1)

    $('.qty_form').blur ->
      $(this).closest('form').submit()

$(document).ready(ready)
$(document).on('page:load', ready)