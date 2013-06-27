module Seeders
  module Categories
    class << self
      def seed
        Category.destroy_all

        category_list.each do |name|
          Category.create(name: name)
        end
      end

      def category_list
        ["Acrobat", "Actor", "Children's entertainer", "Clown", "Comedian", "Dancer", "Hypnotist",
          "Impressionist", "Kabaret", "Magician", "Mime", "Musician", "Pyschic",
            "Storyteller", "Ventriloquist", "Other"]
      end
    end
  end
end


