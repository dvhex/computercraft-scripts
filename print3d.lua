os.loadAPI("disk/main")

local function readFile(fname)
    i = 1;
    j = 1;
    local matrix = {};
    local file = io.open(fname);
    for line in file:lines() do
        if (i==1) then
            table.insert(matrix, {});
        end
        if (line:len() == 0) then
            i=i+1;
            j=1;
        else
            table.insert(matrix[i], line);
            j=j+1;
        end
    end
    file:close();
    return matrix;
end

local function printMatrix(M)
    for i=1,#M do
        print("Line ", i);
        for j=1,#M[i] do
            print(M[i][j]);
        end
    end
end

local function toIndex(c)
    if (c == nil) then print("Char is nil"); return 0; end
    local index = tonumber(c);
    if (index == nil) then return 0; end
    if (index > 0) then return index + 1; end
    c = string.lower(c);
    index = 10 + string.byte(c)[1] - string.byte("a")[1];
    if (index <= 15) then
        return index + 1;
    else
        return 0;
    end
end

local function doChar(c)
    local index = toIndex(c);
    write(index);
    if (index > 0) then
        turtle.select(index);
        turtle.placeDown();
    end
    write("\n");
end

local function doTwoLines(l1, l2)
    local lenght=l1:len();
    if (l2 == nil) then
        l2 = "";
    elseif (l2:len() > lenght) then
        lenght = l2:len();
    end
    local k;
    for k=1,lenght do
        doChar(string.sub(l1,k,k));
        main.stepForward();
    end
    main.turn(true);
    main.stepForward();
    main.turn(true);
    for k=lenght,1,-1 do
        main.stepForward();
        doChar(string.sub(l2,k,k));
    end
    main.turn(false);
    main.stepForward();
    main.turn(false);
end

local function doLayer(L)
    local y=0;
    local j;
    for j=1,#L,2 do
        local l1 = L[j];
        local l2;
        if (j>=#L) then
            l2 = "";
        else
            l2 = L[j+1]
        end
        print("Start lines #", j, " and #", j+1);
        doTwoLines(l1, l2);
        y=y+2;
    end
    main.turn(false);
    main.moveForward(y);
    main.turn(true);
end

local function doMatrix(M)
    local z = 0;
    local i;
    main.stepForward();
    for i=1,#M do
        main.stepUp();
        print("Start layer #", i);
        doLayer(M[i]);
        z=z+1;
    end
    main.rotate();
    main.stepForward();
    main.moveDown(z);
    main.rotate();
end

local M = readFile("disk/print.txt");
printMatrix(M);
doMatrix(M);
