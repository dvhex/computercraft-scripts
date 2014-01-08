os.loadAPI("disk/main")

function workStep(l)
    for i=1,l,1 do
        main.stepForward()
        main.selectNoEmpty(2,16)
        turtle.placeDown()
    end
    turtle.turnRight()
    main.stepForward()
    turtle.turnRight()
    for i=1,l,1 do
        main.selectNoEmpty(2,16)
        turtle.placeDown()
        main.stepForward()
    end
    turtle.turnLeft()
    main.stepForward()
    turtle.turnLeft()
end

print("input x:")
local x=read()
print("input y:")
local y=read()

x=x/2

for i=1,x,1 do
    workStep(y)
end
