local newProductor

function Producer( ... )--不停地被挂起和唤醒
	local i = 0
	while i<10 do
		i = i+1
		send(i)
	end
end

function cousumor()
	local i = 0
	local j = 0
	while j<10 do--外部执行工作,要的时候就给我
		j = j+1
		local i = receive()
		print(i)
	end
end

function send(x)
	coroutine.yield(x)--生产线程被挂起 等待消息
end

function receive()--外部执行工作
	local status,value = coroutine.resume(newProductor)
	return value
end

newProductor = coroutine.create(Producer)

cousumor()
--某一线程在执行一个函数或循环等，突然线程被挂起，只有被唤醒(resume)了才能继续按顺序往下执行