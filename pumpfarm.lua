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

function tunnel(lenght)
    for i=1,lenght,1 do
        stepForward()
        turtle.digDown()
    end
end

function go(lenght)
    for i=1,lenght,1 do
        stepForward()
    end
end

function clearInventory()
    for i=2,16,1 do
        turtle.select(i)
        turtle.drop()
    end
end

function work(lenght)
    tunnel(lenght)
    turtle.turnRight()
    tunnel(1)
    turtle.turnRight()
    tunnel(lenght)
    turtle.turnRight()
    go(1)
    clearInventory()
    turtle.turnRight()
end

work(32)
