os.loadAPI("disk/main")

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
        main.stepForward()
        if i % 8 == 0 then
            main.putfakel()
        end
    end
end

function work(lenght)
    main.tunnel(lenght)
    for i=1,2,1 do
        main.stepDown()
    end
    main.rotate()
    back(lenght)
end

print("input size of tunnel: ")
work(read())
