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

function move(x,y,z)
    if z > 0 then
        moveUp(z)
    else
        moveDown(-z)
    end
    if x > 0 then
        turtle.turnRight()
        moveForward(x)
    else
        turtle.turnLeft()
        moveForward(-x)
    end
    if x > 0 then
        turtle.turnLeft()
    else
        turtle.turnRight()
    end
    if y < 0 then
        rotate()
        moveForward(-y)
    else
        moveForward(y)
    end
    if y < 0 then
        rotate()
    end
end

function hDigRound()
    for i=1,4,1 do
        turtle.dig()
        turtle.turnRight()
    end
end

function vDigRound()
    turtle.digDown()
    turtle.turnRight()
    turtle.dig()
    rotate()
    turtle.dig()
    turtle.turnRight()
    turtle.digUp()
end

function clear()
    local result = true
    turtle.turnLeft()
    for i=2,16,1 do
        if turtle.getItemCount(i) ~= 0 then
            turtle.select(i)
            if turtle.drop() == false then
                result = false
                break
            end
        end
    end
    turtle.turnRight()
    return result
end

function workStep(height)
    for i=1,height,1 do
        stepDown()
        hDigRound()
    end
    moveForward(2)
    turtle.turnRight()
    stepForward()
    turtle.turnLeft()
    for i=1,height,1 do
        hDigRound()
        stepUp()
    end
    turtle.turnLeft()
    stepForward()
    turtle.turnLeft()
    moveForward(2)
    rotate()
end

local height=63
local length=8
local width=8

local x=0
local y=0
local z=0

for i=1,length,1 do
    for j=1,width,1 do
        move(x*2+y,y*2-x,z)
        workStep(height)
        move(-x*2-y,-y*2+x,-z)
        while clear() == false do
            z=z-1
            stepUp()
        end
        x=x+1
    end
    x=0
    y=y+2
end
