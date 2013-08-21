function putfakel()
    for i=2,4,1 do
        if turtle.getItemCount(i) > 1 then
            turtle.select(i)
            turtle.placeDown()
            break
        end
    end
end

function tryRefuel()
    local result = true;
    turtle.select(1)
    if turtle.getItemCount(1) <= 1 then
        result = false
    else
        if turtle.getFuelLevel() < 80 then
            turtle.refuel(1)
        end
    end
    return result;
end

function stepForward()
    tryRefuel()
    repeat
        turtle.dig()
    until turtle.forward()
end

function tunnel(lenght)
    for i=0,lenght-1,1 do
        stepForward()
        turtle.digDown()
        if i % 8 == 0 then
            putfakel()
        end
    end
end

function go(lenght)
    for i=1,lenght,1 do
        stepForward()
    end
end

function rotate()
    turtle.turnRight()
    turtle.turnRight()
end

function turn(right)
    if right then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end
end

function clear(pos, right, ending)
    local len = pos*6 + 4
    turn(not right)
    go(len)
    for i=5,16,1 do
        turtle.select(i)
        turtle.dropDown()
    end
    if not ending then
        rotate()
        go(len)
        turn(not right)
    end
end

function step(lenght, right, first)
    turn(right)
    if (first) then
        tunnel(3)
    else
        tunnel(6)
    end
    rotate()
    go(3)
    turn(right)
    tunnel(lenght)
    turn(right)
    tunnel(6)
    rotate()
    go(3)
    turn(not right)
    tunnel(lenght)
    rotate()
end


local count=4
local size=64
local right=true
for i=0,count-1,1 do
    step(size,right,i==0)
    clear(i, right, i==count-1)
end
