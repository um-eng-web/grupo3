class Car
	def initialize(mileage,service)
		@mileage=mileage
		@service=service
	end
	
	def log(miles)
		@mileage+=miles
	end
	def checkService()
		return @mileage>@service
	end
	
	def goService()
		@mileage=0
	end
	
	def show()
		puts @mileage
		puts @service
	end
	
	car = Car.new(0,100)
	car.show
	car.log(10)
	car.show
	puts car.checkService.to_s
	car.show
	car.goService
end