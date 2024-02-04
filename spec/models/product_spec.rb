require_relative '../../lib/models/product'

RSpec.describe Product do
  describe '#initialize' do
    context 'Happy Path' do
      let(:line) { '2 book at 12.49' }
      let(:product) { Product.new(line) }

      it 'parses quantity correctly' do
        expect(product.quantity).to eq(2)
      end

      it 'parses description correctly' do
        expect(product.description).to eq('book')
      end

      it 'parses price correctly' do
        expect(product.price).to eq(12.49)
      end

      it 'categorizes the product correctly' do
        expect(product.category).to eq('book')
      end

      it 'is not imported' do
        expect(product.imported?).to be false
      end

      it 'is tax exempt' do
        expect(product.tax_exempt?).to be true
      end

      context 'when it is imported' do
        let(:line) { '1 imported box of chocolates at 10.00' }

        it 'is imported' do
          expect(product.imported?).to be true
        end

        it 'is tax exempt' do
          expect(product.tax_exempt?).to be true
        end
      end

      context 'when it is not tax exempt' do
        let(:line) { '1 music CD at 14.99' }

        it 'is not tax exempt' do
          expect(product.tax_exempt?).to be false
        end
      end
    end
  end
end
