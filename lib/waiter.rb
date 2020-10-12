require 'pry'

class Waiter
    
    attr_reader :name, :exp

    @@all = []

    # CLASS METHODS #

    def self.all
        @@all
    end

    # INSTANCE METHODS #

    def initialize(name, exp)
        @name, @exp = name, exp
        self.save
    end

    def save
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        #arr of meal objs this waiter has served
        Meal.all.select {|meal_obj| self == meal_obj.waiter}
    end

    def best_tipper
        #customer with highest tip that this waiter has served THROUGH meals
        self.meals.reduce do |accumulator, current|
            current.tip > accumulator.tip ? current : accumulator
        end.customer
    end

end