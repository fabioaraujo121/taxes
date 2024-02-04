module Imported
  def imported?
    description.downcase.include?('imported')
  end
end
