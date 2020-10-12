require 'pry'

class Customer
    attr_reader :name, :age
    
    @@all = []

    # CLASS METHODS #

    def self.all
        @@all
    end

    # INSTANCE METHODS #

    def initialize(name, age)
        @name, @age = name, age
        self.save
    end

    def save
        @@all << self
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        #returns arr of meal instances THIS (self) customer ordered
        Meal.all.select {|meal_obj| self == meal_obj.customer}
    end

    def waiters
        #arr of waiters THIS customer ordered through
        self.meals.map {|meal_obj| meal_obj.waiter}
    end

end
