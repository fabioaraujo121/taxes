require_relative 'lib/models/product'
require_relative 'lib/services/tax_calculator'

# Read the file line by line and process each line
def process_input_file(file_path)
  if File.exist?(file_path)
    File.open(file_path, 'r') do |file|
      total       = 0.0
      total_taxes = 0.0

      file.each_line do |line|
        line.chomp! # Remove trailing newline character
        product        = Product.new(line)
        tax_calculator = TaxCalculator.calculate_tax(product)
        total_price    = (product.price + tax_calculator[:sales_tax]) * product.quantity
        total         += total_price
        total_taxes   += tax_calculator[:sales_tax] * product.quantity

        puts "#{product.quantity} #{product.description}: #{'%.2f' % (total_price)}"
      end
      puts "Sales Taxes: #{'%.2f' % total_taxes}"
      puts "Total: #{'%.2f' % total}"
    end
  else
    puts "File not found: #{file_path}"
  end
end


if __FILE__ == $PROGRAM_NAME
  input_file = './data/input.txt' # Change this to your file's path
  process_input_file(input_file)
end
