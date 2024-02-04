module TaxExemption
  def tax_exempt?
    %w[book food medical].include?(category.to_s.downcase)
  end
end
