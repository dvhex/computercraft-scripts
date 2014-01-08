os.loadAPI("disk/main")

function tunnel3(length)
    for i=1,length,1 do
        main.stepForward()
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

x=x/2
z=z/3
for k=1,z,1 do
    for i=1,x,1 do
        workStep(y)
    end
    turtle.turnLeft()
    main.moveForward(x*2)
    clearInventory()
    turtle.turnRight()
    if k ~= z then
        main.moveDown(3)
    end
end
