ActiveAdmin.register CurrencyValue do
  menu false
  permit_params :gbp, :usd, :eur

end
