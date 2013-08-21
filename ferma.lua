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

function moveForward(len)
    for i=1,len,1 do
        stepForward()
    end
end

function clearInventory()
    for i=6,16,1 do
        turtle.select(i)
        turtle.drop()
    end
end

function workStep(len, index)
    for i=1,len,1 do
        stepForward()
        turtle.digDown()
        if index ~= 0 then
            turtle.digDown()
            turtle.select(index)
            turtle.placeDown()
        end
    end
    turtle.turnRight()
    stepForward()
    turtle.turnRight()
    for i=1,len,1 do
        turtle.digDown() --собрать
        if index ~= 0 then
            turtle.digDown() --вспахать
            turtle.select(index)
            turtle.placeDown()
        end
        stepForward()
    end
    turtle.turnLeft()
    stepForward()
    turtle.turnLeft()
end

function ferma()
    local len=32
    --пшеница--
    workStep(len, 2)
    workStep(len, 3)
    --картошка--
    workStep(len, 4)
    --морковка--
    workStep(len, 5)
    turtle.turnLeft()
    moveForward(8)
    --turtle.turnRight()
    --moveForward(2)
    --turtle.turnLeft()
    --тыквы, арбузы--
    --workStep(len, 0)
    --turtle.turnLeft()
    --moveForward(12)
    clearInventory()
    turtle.turnRight()
    --rotate()
    --moveForward(10)
    --turtle.turnLeft()
end

--while true do
    ferma()
    --sleep(2400)
--end
