module TaxCalculator
  BASIC_SALES_TAX_RATE = 10
  IMPORT_DUTY_TAX_RATE = 5

  class << self
    def calculate_tax(product)
      sales_tax = calculate_basic_sales_tax(product)
      sales_tax += calculate_import_duty_tax(product) if product.imported?
      { sales_tax: sales_tax }
    end

    def calculate_basic_sales_tax(product)
      return 0 if product.tax_exempt?
      tax = (product.price * BASIC_SALES_TAX_RATE / 100.0).ceil(2)
      round_to_nearest_0_05(tax)
    end

    def calculate_import_duty_tax(product)
      tax = (product.price * IMPORT_DUTY_TAX_RATE / 100.0).ceil(2)
      round_to_nearest_0_05(tax)
    end

    def round_to_nearest_0_05(tax)
      (tax * 20).ceil / 20.0
    end
  end
end
