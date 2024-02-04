# spec/services/tax_calculator_spec.rb

require_relative '../../lib/services/tax_calculator'
require_relative '../../lib/models/product'

RSpec.describe TaxCalculator do
  describe '#calculate_tax' do
    context 'when the product is not imported and not tax exempt' do
      let(:product) { Product.new('1 perfume at 47.50') }

      it 'returns the correct sales tax' do
        expect(TaxCalculator.calculate_tax(product)[:sales_tax]).to eq(4.75)
      end
    end
  end

  describe '#calculate_basic_sales_tax' do
    context 'when the product is not tax exempt' do
      let(:product) { Product.new('1 book at 12.49') }

      it 'returns the correct basic sales tax' do
        expect(TaxCalculator.calculate_basic_sales_tax(product)).to eq(0)
      end
    end
  end

  describe '#calculate_import_duty_tax' do
    context 'when the product is imported' do
      let(:product) { Product.new('1 imported perfume at 47.50') }

      it 'returns the correct import duty tax' do
        expect(TaxCalculator.calculate_import_duty_tax(product)).to eq(2.40)
      end
    end
  end

  describe '#round_to_nearest_0_05' do
    it 'rounds the tax to the nearest 0.05' do
      expect(TaxCalculator.round_to_nearest_0_05(3.56)).to eq(3.60)
    end
  end
end
