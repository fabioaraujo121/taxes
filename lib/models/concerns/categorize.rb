module Categorize
  CATEGORIES = {
    'food'     => ['chocolate', 'chocolates'],
    'medical'  => ['headache', 'headache', 'pills', 'pill'],
    'book'     => ['book', 'books'],
    'cosmetic' => ['perfume', 'perfumes']
  }

  # Returns the best matching category
  def categorize
    max_count         = 0
    matching_category = nil

    CATEGORIES.each do |category, items|
      count = items.count { |item| description.downcase.include?(item) }
      if count > max_count
        max_count = count
        matching_category = category
      end
    end

    matching_category
  end
end
