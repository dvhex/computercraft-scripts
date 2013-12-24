os.loadAPI("main")

function workStep(height)
    for i=1,height,1 do
        main.stepDown()
        main.hDigRound()
    end
    main.moveForward(2)
    turtle.turnRight()
    main.stepForward()
    turtle.turnLeft()
    for i=1,height,1 do
        main.hDigRound()
        main.stepUp()
    end
    turtle.turnLeft()
    main.stepForward()
    turtle.turnLeft()
    main.moveForward(2)
    main.rotate()
end

local height=63
local length=8
local width=8

local x=0
local y=0
local z=0

for i=1,length,1 do
    for j=1,width,1 do
        main.move(x*2+y,y*2-x,z)
        workStep(height)
        main.move(-x*2-y,-y*2+x,-z)
        while main.clear() == false do
            z=z-1
            main.stepUp()
        end
        x=x+1
    end
    x=0
    y=y+2
end
