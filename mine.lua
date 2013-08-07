--Программа роет шахту (туннель 1x2 через 2 блока)--
--В первом слоте должно быть топливо, в 15м сундуки, в 16м факелы--
function putfakel()
    turtle.select(16)
    turtle.placeDown()
end

function tunnel(lenght)
    for i=0,lenght-1,1 do
        while turtle.forward() ~= true do
            turtle.dig()
        end
        turtle.digDown()
        if i % 8 == 0 then
            putfakel()
        end
    end
end

function go(lenght)
    local i=0
    while i<lenght do
        if turtle.forward() then
            i=i+1
        end
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

function clear()
    turtle.select(15)
    turtle.digDown()
    turtle.placeDown()
    for i=1,14,1 do
        turtle.select(i)
        turtle.dropDown()
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
    clear()
end

turtle.select(1)
turtle.refuel()

local count=4
local size=64
for i=0,count-1,1 do
    step(size,false,i==0)
end
