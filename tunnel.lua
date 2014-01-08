os.loadAPI("disk/main")

function back(lenght)
    for i=1,lenght,1 do
        turtle.digDown()
        selectNoEmpty()
        main.selectNoEmpty(5,16)
        turtle.placeDown()
        main.stepForward()
        if i % 8 == 0 then
            main.putfakel()
        end
    end
end

function work(lenght)
    main.clearTunnel(lenght)
    for i=1,2,1 do
        main.stepDown()
    end
    main.rotate()
    back(lenght)
end

print("input size of tunnel: ")
work(read())
