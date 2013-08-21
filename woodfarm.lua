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

function clear()
    for i=3,16,1 do
        turtle.select(i)
        turtle.drop()
    end
end

function lomai(x,y,z)
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
            moveUp(3)
        end
    end
    moveDown(3*(z-1))
end

function placeStep(len)
    for i=1,len,1 do
        stepForward()
        turtle.select(2)
        turtle.placeDown()
    end
    turtle.turnRight()
    stepForward()
    turtle.turnRight()
    for i=1,len,1 do
        turtle.select(2)
        turtle.placeDown()
        stepForward()
    end
    turtle.turnLeft()
    stepForward()
    turtle.turnLeft()
end

function place(x,y)
    x=x/2
    for i=1,x,1 do
        placeStep(y)
    end
    turtle.turnLeft()
    moveForward(x*2)
    turtle.turnRight()
end

local x=6
local y=6
local z=12

lomai(x+8,y+8,z)
turtle.turnLeft()
clear()
turtle.turnRight()

moveForward(4)
turtle.turnRight()
moveForward(4)
turtle.turnLeft()
place(x,y)
turtle.turnLeft()
moveForward(4)
turtle.turnLeft()
moveForward(4)
rotate()
