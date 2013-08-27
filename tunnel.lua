function rotate()
    turtle.turnRight()
    turtle.turnRight()
end

function putfakel()
    for i=2,4,1 do
        if turtle.getItemCount(i) > 1 then
            turtle.select(i)
            turtle.placeUp()
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
    end
end

function selectNoEmpty()
    for i=5,16,1 do
        if turtle.getItemCount(i) > 1 then
            turtle.select(i)
            break
        end
    end
end

function back(lenght)
    for i=1,lenght,1 do
        turtle.digDown()
        selectNoEmpty()
        turtle.placeDown()
        stepForward()
        if i % 8 == 0 then
            putfakel()
        end
    end
end

function stepDown()
    while not turtle.down() do
        turtle.digDown()
    end
end

function work(lenght)
    tunnel(lenght)
    for i=1,2,1 do
        stepDown()
    end
    rotate()
    back(lenght)
end

work(250)
