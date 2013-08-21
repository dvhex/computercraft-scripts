function rotate()
    turtle.turnRight()
    turtle.turnRight()
end

function tryRefuel()
    local result = true;
    if turtle.getItemCount(1) <= 1 then
        result = false
    else
        if turtle.getFuelLevel() < 80 then
            turtle.select(1)
            turtle.refuel(1)
        end
    end
    return result;
end

function stepForward()
    tryRefuel()
    while turtle.forward() == false do

    end
end

function workStep(l,index)
    for i=1,l,1 do
        stepForward()
        turtle.select(index)
        turtle.placeDown()
    end
    turtle.turnRight()
    stepForward()
    turtle.turnRight()
    for i=1,l,1 do
        turtle.select(index)
        turtle.placeDown()
        stepForward()
    end
    turtle.turnLeft()
    stepForward()
    turtle.turnLeft()
end

local x=2
local y=32

x=x/2

for i=1,x,1 do
    workStep(y,i+1)
end
