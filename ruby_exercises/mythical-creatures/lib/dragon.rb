class Dragon
    attr_reader :name,
                :color,
                :rider,
                :hungry,
                :food

   def initialize(name, color, rider)
    @name = name
    @color = color
    @rider= rider
    @hungry = true
    @food = 0
   end

   def hungry?
    @hungry
   end

   def eat
   @food += 1
   if @food >= 3
    @hungry = false
   end
 end
end 

# other ways of doing this
#  def eat
#     @food += 1
#     if food < 3
#       @hungry = true
#     else
#       @hungry = false
#     end


# def  3.each.times do |hungry|
#     hungry = false
#  end
# end
