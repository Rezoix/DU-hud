system.showScreen(1)


function updateHud()
    pitch = gyro.getPitch()
    roll = gyro.getRoll()

    content = [[
    <head>
        <style>
            body {margin: 0}
        </style>
    </head>
    <body>
        <svg height="100%" width="100%" viewBox="0 0 1920 1080">
            <g>
                <line x1="939" y1="50%" x2="957" y2="519" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <line x1="939" y1="543" x2="957" y2="561" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <line x1="981" y1="537" x2="963" y2="519" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <line x1="981" y1="543" x2="963" y2="561" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>

                <line x1="932" y1="540" x2="945" y2="540" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <line x1="988" y1="540" x2="975" y2="540" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <line x1="960" y1="512" x2="960" y2="525" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <line x1="960" y1="568" x2="960" y2="555" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>

                <line x1="920" y1="540" x2="840" y2="540" style="stroke:rgb(1, 165, 177);opacity:0.175;stroke-width:3"/>
                <line x1="1000" y1="540" x2="1080" y2="540" style="stroke:rgb(1, 165, 177);opacity:0.175;stroke-width:3"/>
                <line x1="960" y1="500" x2="960" y2="470" style="stroke:rgb(1, 165, 177);opacity:0.175;stroke-width:3"/>
                <line x1="960" y1="580" x2="960" y2="610" style="stroke:rgb(1, 165, 177);opacity:0.175;stroke-width:3"/>

                <text x="785" y="530" style="fill:rgb(1, 165, 177);text-anchor:start;font-size:10;font-family:Montserrat;font-weight:bold">PITCH</text>
                <text x="1135" y="530" style="fill:rgb(1, 165, 177);text-anchor:end;font-size:10;font-family:Montserrat;font-weight:bold">PITCH</text>
                <polygon points="782,540 800,535 800,545" style="fill:rgb(1, 165, 177);opacity:0.7"/>
                <polygon points="1138,540 1120,535 1120,545" style="fill:rgb(1, 165, 177);opacity:0.7"/>

                <text x="960" y="688" style="fill:rgb(1, 165, 177);text-anchor:middle;font-size:10;font-family:Montserrat;font-weight:bold">ROLL</text>
                <polygon points="960,710 955,692 965,692" style="fill:rgb(1, 165, 177);opacity:0.7"/>

                <polyline points="790,550 785,550 785,650 790,650" x1="785" y1="550" x2="785" y2="650" style="stroke:rgb(1, 165, 177);opacity:0.7;stroke-width:3"/>
                <text x="790" y="660" style="fill:rgb(1, 165, 177);text-anchor:start;font-size:10;font-family:Montserrat;font-weight:bold">THRL</text>

                <polygon points="788,600 800,597 800,603" style="fill:rgb(1, 165, 177);opacity:0.7"/>
            </g>]]
    
    pitchC = math.floor(pitch/10)
    for i = pitchC-2,pitchC+2 do
        num = 10*i
        if (num > 180) then
            num = -180 + 10*(i-18)
        elseif (num < -170) then
            num = 180 + 10*(i+18)
        end

        content = content..[[<g transform="translate(0 ]]
        content = content..((-5 - 50*i) + pitch*5)
        content = content..[[)">
            <text x="745" y="540" style="fill:rgb(1, 165, 177);text-anchor:end;font-size:12;font-family:Montserrat;font-weight:bold">]]
        content = content..num
        content = content..[[</text>
            <text x="1175" y="540" style="fill:rgb(1, 165, 177);text-anchor:start;font-size:12;font-family:Montserrat;font-weight:bold">]]
        content = content..num
        content = content..[[</text></g>]]
    end
    
    pitchB = math.floor(pitch)
    for i = pitchB-20,pitchB+30 do
        len = 5
        if (i%10==0) then
            len = 30
        elseif (i%5==0) then
            len = 15
        end

        content = content..[[
        <g transform="translate(0 ]]
        content = content..(40 -i*5 + pitch*5)
        content = content..[[)">
            <line x1="]]
        content = content..(780-len)
        content = content..[[" y1="540" x2="780" y2="540"style="stroke:rgb(1, 165, 177);opacity:0.3;stroke-width:3"/>
            <line x1="]]
        content = content..(1140+len)
        content = content..[[" y1="540" x2="1140" y2="540"style="stroke:rgb(1, 165, 177);opacity:0.3;stroke-width:3"/></g>]]
    end
    
    rollC = math.floor(roll)
    for i = rollC-35,rollC+35 do
        if (i%10==0) then
            num = math.abs(i)
            if (num > 180) then
            	num = 180 + (180-num) 
            end
            content = content..[[<g transform="rotate(]]
            content = content..(i - roll)
            content = content..[[,960,490)">
                <text x="960" y="750" style="fill:rgb(1, 165, 177);text-anchor:middle;font-size:12;font-family:Montserrat;font-weight:bold">]]
            content = content..num
            content = content..[[</text></g>]]
        end

        len = 5
        if (i%10==0) then
            len = 15
        elseif (i%5==0) then
            len = 10
        end

        content = content..[[<g transform="rotate(]]
            content = content..(i - roll)
            content = content..[[,960,490)">
            <line x1="960" y1="715" x2="960" y2="]]
        content = content..(715+len)
        content = content..[[" style="stroke:rgb(1, 165, 177);opacity:0.3;stroke-width:2"/></g>]]
    end

    content = content..[[<g transform="translate(0 ]]
    content = content..unit.getThrottle()
    content = content..[[)">
            <polygon points="788,650 800,647 800,653" style="fill:rgb(1, 165, 177);opacity:0.7"/>
        </g>]]
    

    content = content..[[
        </svg>
    </body>
    ]]
    system.setScreen(content)
end