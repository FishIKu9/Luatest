--Meta class
Shape = {area = 0}
--基类的方法
function Shape:new(o,side)--[相当于实例化函数]因为是冒号所以不用传self,若不传self导致若全局变量改变会出错，self保证了是内部变量在改变，保证了封装性
	o = o or {}
	setmetatable(o,self)--创建一个新的实例对象时，这个o要和元表进行关联，没有就去元表找 （利用这个将值赋给Rectangle)
	self.__index = self--如果子类没有则找父类,__index函数不设置将会传回nil
	side = side or 0
	self.area = side + side
	return o

end

--子类与子类的方法
Rectangle = Shape:new()--创建一个table(对象),将shape中的area赋值给新的table Rectangle获得了基类的所有方法 area是执行了函数后获得的 也就是执行后已经和shape无关了

function Rectangle:new(o,length,width)--重写new函数 
	o = o or Shape:new()
	setmetatable(o,self)--o只是一个{},没有area,调用area的时候使用元表的area 显然这里已经重写了new 元表已经变成了rectangle 元表只能有一个
	self.__index = self
	self.area = length * width --area已经赋值给rectangle，与原来的area已经无关
	return o
end

function Rectangle:print()
	print(self.area)
end

myrectangle = Rectangle:new(nil,100,200)

myrectangle:print()--新对象的表没有print函数就去找元表rectangle的函数，有则调用

--texta