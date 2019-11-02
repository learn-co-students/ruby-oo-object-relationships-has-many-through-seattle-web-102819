require 'pry'

class Waiter
    attr_reader :name, :years_of_experience

    @@all = []

    def self.all
        @@all
    end
    
    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience

        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipper = meals.max do |x, y|
            x.tip <=> y.tip
        end
        best_tipper.customer
    end
end