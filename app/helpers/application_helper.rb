module ApplicationHelper
  def to_currency(value)
    number_to_currency(value, unit: "£", separator: ",", delimiter: " ", format: "%u %n", precision: 0)
  end
end
