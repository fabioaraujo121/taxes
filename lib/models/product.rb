require_relative 'concerns/categorize'
require_relative 'concerns/imported'
require_relative 'concerns/tax_exemption.rb'

class Product
  include Categorize
  include Imported
  include TaxExemption

  attr_reader :quantity, :description, :price, :category

  def initialize(line)
    parts                   = line.split(' at ')
    @quantity, @description = parts[0].split(' ', 2)
    @quantity               = @quantity.to_i
    @price                  = parts[1].to_f
    @category               = categorize
  end
end
