os.loadAPI("disk/main")

function goUp(high)
    local h = high-3
    while h>0 do
        main.moveUp(3)
        h = h - 3
    end
end

function tunnel3(length)
    for i=1,length,1 do
        main.stepForward()
        turtle.digDown()
        turtle.digUp()
    end
end

function rawWorkStep(length)
    tunnel3(length-1)
    turtle.turnRight()
    tunnel3(1)
    turtle.turnRight()
    tunnel3(length-1)
end

function fullWorkStep(length)
    rawWorkStep(length)
    turtle.turnLeft()
    tunnel3(1)
    turtle.turnLeft()
end

function lastWorkStep(length)
    rawWorkStep(length)
    turtle.turnRight()
end

function clearInventory()
    turtle.select(16)
    while turtle.place() == false do
        turtle.dig()
    end
    for i=2,15,1 do
        turtle.select(i)
        turtle.drop()
    end
end

print("input x:")
local x=read()
print("input y:")
local y=read()
print("input z:")
local z=read()

tunnel3(1)
goUp(z)
x=x/2
z=(z+2)/3 -- при высоте 1-3 будет 1, 4-6 - 2 и т.д.
for k=1,z,1 do
    for i=1,x-1,1 do
        fullWorkStep(y)
    end
    lastWorkStep(y)
    tunnel3(x*2-1)
    clearInventory()
    if k <= z-1 then
        turtle.turnRight()
        main.moveDown(3)
    else
        turtle.turnLeft()
        main.stepForward()
        main.rotate()
    end
end
