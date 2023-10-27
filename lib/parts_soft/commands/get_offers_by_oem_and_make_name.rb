# frozen_string_literal: true

module PartsSoft
  class Commands::GetOffersByOemAndMakeName < Commands
    def name
      :get_offers_by_oem_and_make_name
    end

    def without_cross
      true
    end
  end
end
