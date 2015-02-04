-- Скрипт работает следующим образом:
-- Ставим черепаху справа сверху от сундука, рядом ставим дисковод, переходим в
-- паку "disk", вызываем скрипт. Черепашка копает тоннели высотой 2 блока на
-- расстоянии 2 блока друг от друга. При вызове скрипта задаётся количество пар
-- тоннелей, длина тоннелей и направление (в случае выбора левого направления,
-- черепашку ставить слева от сундука. В инвенторе в первой позиции должен быть
-- уголь, желательно каменный, чтобы черепашка могла его пополнять, и следующие
-- три позиции - факелы, чтобы черепашка освещала туннели.

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


print("input count of tunnel pairs:")
local count=tonumber(read())
print("count tunnel pairs is " .. count)
print("input length of mine:")
local size=tonumber(read())
print("length of mine is " .. size)
print("input direction of moving (0-left, 1-right):")
local z=tonumber(read())
local right=false
if (z == 0) then
    right = false
    print("direction is left")
else
    if (z == 1) then
        right = true
        print("direction is right")
    else
        print("Incorrect direction: " .. z);
        return
    end
end
for i=0,count-1,1 do
    step(size,right,i==0)
    clear(i, right, i==count-1)
end
