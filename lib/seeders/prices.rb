module Seeders
  module Prices
    class << self
      def seed
        Price.destroy_all

        price_list.each do |name|
          Price.create(range: name)
        end
      end

      def price_list
        ['0 - 25', '25 - 50', '50 - 75', '75 - 100', '100 - 150', '150 - 200', '200+']
      end
    end
  end
end
