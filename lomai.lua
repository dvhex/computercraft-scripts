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
        turtle.dig()
    end
end

function stepUp()
    tryRefuel()
    while turtle.up() == false do
        turtle.digUp()
    end
end

function stepDown()
    tryRefuel()
    while turtle.down() == false do
        turtle.digDown()
    end
end

function moveForward(count)
    for i=1,count,1 do
        stepForward()
    end
end

function moveUp(count)
    for i=1,count,1 do
        stepUp()
    end
end

function moveDown(count)
    for i=1,count,1 do
        stepDown()
    end
end

function tunnel3(length)
    for i=1,length,1 do
        stepForward()
        turtle.digDown()
        turtle.digUp()
    end
end

function workStep(length)
    tunnel3(length)
    turtle.turnRight()
    tunnel3(1)
    turtle.turnRight()
    tunnel3(length)
    turtle.turnLeft()
    tunnel3(1)
    turtle.turnLeft()
end

local x=16
local y=16
local z=9

x=x/2
z=z/3
for k=1,z,1 do
    for i=1,x,1 do
        workStep(y)
    end
    turtle.turnLeft()
    moveForward(x*2)
    turtle.turnRight()
    if k ~= z then
        moveDown(3)
    end
end
