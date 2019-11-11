class Waiter
    attr_accessor :name, :experience
    @@all = []
    
    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        tips = 0
        ml = Meal.all.select{|meal| meal.waiter == self}
        ml.map do |meal| 
        if meal.tip > tips
        tips = meal.tip
        end
    end

        # meal.customer
    en
end