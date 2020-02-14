--[[
	Rail Fence Cipher
	implemented in pure lua
	by kotahu
	(kotahu.github.io)
	This cipher isn't strong
	enough for actually
	storing or transporting
	secrets.
	We'll see if people
	online can make any sense
	of it!
--]]
function round(num)
	local mult=1
	return math.floor(num*mult+0.5)
end
function encode(text)
	local to={}
	local tt={}
	local frago=""
	local fragt=""
	for i=1,string.len(text) do
		if (i%2==0) then
			tt[#tt+1]=string.sub(text,i,i)
		else
			to[#to+1]=string.sub(text,i,i)
		end
	end
	for _,b in pairs(to) do
		frago=frago..b
	end 
		for _,b in pairs(tt) do
		fragt=fragt..b
	end
	return frago..fragt
end
function decode(text)
	local div = round(string.len(text)/2)
	local frago=string.sub(text,1,div)
	local fragt=string.sub(text,div+1,-1)
	local rest=""
	for i=1,div do
		rest=rest..string.sub(frago,i,i)
		rest=rest..string.sub(fragt,i,i)
	end
	return rest
end
