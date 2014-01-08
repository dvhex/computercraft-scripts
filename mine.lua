os.loadAPI("disk/main")

function clear(pos, right, ending)
    local len = pos*6 + 4
    main.turn(not right)
    main.go(len)
    for i=5,16,1 do
        turtle.select(i)
        turtle.dropDown()
    end
    if not ending then
        main.rotate()
        main.go(len)
        main.turn(not right)
    end
end

function step(lenght, right, first)
    main.turn(right)
    if (first) then
        main.tunnel(3)
    else
        main.tunnel(6)
    end
    main.rotate()
    main.go(3)
    main.turn(right)
    main.tunnel(lenght)
    main.turn(right)
    main.tunnel(6)
    main.rotate()
    main.go(3)
    main.turn(not right)
    main.tunnel(lenght)
    main.rotate()
end


local count=4
local size=64
local right=true
for i=0,count-1,1 do
    step(size,right,i==0)
    clear(i, right, i==count-1)
end
