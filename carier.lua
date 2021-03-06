os.loadAPI("disk/main")

local max_filter_item=4 -- Если задать 1, фильтр не сработает и будет работать, как обычный карьер

function workStep(height)
    for i=1,height,1 do
        main.stepDown()
        if i>1 and main.selectNoEmpty(2,max_filter_item) then
            turtle.placeUp()
        end
        main.hFilterDigRound(2,max_filter_item)
    end
    main.moveForward(2)
    turtle.turnRight()
    main.stepForward()
    turtle.turnLeft()
    for i=1,height,1 do
        main.hFilterDigRound(2,max_filter_item)
        main.stepUp()
        if main.selectNoEmpty(2,max_filter_item) then
            turtle.placeDown()
        end
    end
    turtle.turnLeft()
    main.stepForward()
    turtle.turnLeft()
    main.moveForward(2)
    main.rotate()
end

print("Input height:")
local height=read()
print("Input length [8]:")
local length=read()/2
print("Input width [8]:")
local width=read()

local x=0
local y=0
local z=0

for i=1,length,1 do
    for j=1,width,1 do
        -- Хватит топлива на следующий шаг? (с запасом в 1 кусок угля, если это уголь, конечно)
        while 2 * (x + 3*y + z + 3 + height) > turtle.getFuelLevel() + (turtle.getItemCount(1) - 2) * 80 do
            print("Not enouth fuel for next step! Please input fuel in 1st slot and press Enter.")
            read()
        end
        main.move(x*2+y,y*2-x,z)
        workStep(height)
        main.move(-x*2-y,-y*2+x,-z)
        while main.clearRangeInInventory(max_filter_item+1,16) == false do
            z=z-1
            main.stepUp()
        end
        x=x+1
    end
    x=0
    y=y+2
end
