class ArrayRegression < Array
	def mean
		return Float (self.sum/self.size)
	end

	def sum
		r = 0.0
		self.each{|x|r=r+x}
		return r
	end

	def sumSquare
		r = 0.0
		self.each{|x|r=r+x**2}
		return r
	end

	def times(eArray)
		r = 0.0
		self.each_index{|x|r=r+self[x]*eArray[x]}
		return r
	end
end

class Regression
	@@numX = ArrayRegression.new
	@@numY = ArrayRegression.new
	def initialize
		@numX = ArrayRegression.new
		@numY = ArrayRegression.new
	end
	def addX(xNum)
		@numX.push(xNum)
	end
	def addY(yNum)
		@numY.push(yNum)
	end
	def sd
		return @numY.sumAnother(@numY)
	end
	def b0
		return @numY.mean-(self.b1*@numX.mean)
	end

	def b1
		term1 = @numX.times(@numY)-(Float(@numX.size()*@numX.mean*@numY.mean))
		term2 = @numX.sumSquare-(@numX.size()*Float(@numX.mean**2))
		return Float(term1 / term2)
	end

	def printEquation
		puts "y="+String(self.b0)+"+"+String(self.b1)+"x"
	end
end
