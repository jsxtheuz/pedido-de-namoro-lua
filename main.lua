LOADING = "yes"
local center_x = display.contentCenterX
local center_y = display.contentCenterY 

local function play_yes()

    local text_yes = display.newText( {text= "EU TE AMO MINHA PRINCESA <3", x=center_x, y=center_y - 70, font ="fonts/comic-sans.ttf", fontSize= 35 })
	text_yes:setFillColor( 1, 1, 1 )

    local heart = display.newImageRect( "imagens/heart.png", 165, 150)
    heart.x = center_x 
	heart.y = center_y + 60

    local text_heart = display.newText( {text= "EU + VC", x=center_x, y=center_y + 60, font ="fonts/comic-sans.ttf", fontSize= 15 })
	text_heart:setFillColor( 1, 1, 1 )

    timer.performWithDelay( 15000, function() 
        display.remove(text_heart)
        display.remove(heart)
        display.remove(text_yes)
        LOADING = "finish"
    end, 1)

end

local function play()

    local bk_play = display.newImageRect( "imagens/bk-play.png", 800, 300)
    bk_play.x = center_x 
	bk_play.y = center_y - 100


    
    local button_no = display.newText( {text= "NÃO", x=center_x, y=center_y - 20, font ="fonts/comic-sans.ttf", fontSize= 35 })
	button_no:setFillColor( 1, 1, 1 )
    
    local function no_verify(event)
        
        if event.phase == 'began' then
            
            button_no.x =  math.random(50, 550)
            button_no.y = math.random(100, 250)
            
        elseif event.phase == 'ended' then
            
            print("Event Finalized")
        end
        
    end
    button_no:addEventListener('touch', no_verify)


    
    local button_yes = display.newText( {text= "SIM", x=center_x, y=center_y + 40, font ="fonts/comic-sans.ttf", fontSize= 35 })
    button_yes:setFillColor( 1, 1, 1 )

    local function yes_verify(event)
    
        if event.phase == 'began' then
    
           button_yes.XScale = 0.7
           button_yes.yScale = 0.7
    
        elseif event.phase == 'ended' then

            button_yes.XScale = 1
            button_yes.yScale = 1
            timer.performWithDelay( 150, function() 
                display.remove(button_yes)
                display.remove(button_no)
                display.remove(bk_play)
                play_yes()
            end, 1)
            
        end
        
    end
    button_yes:addEventListener('touch', yes_verify)

end


local function menu()

    local bk_menu = display.newImageRect( "imagens/bk-menu.png", 820, 420 )
    bk_menu.x = center_x 
	bk_menu.y = center_y - 50
    local button_menu = display.newImageRect( "imagens/play.png", 75, 75 )
	button_menu.x = center_x 
	button_menu.y = center_y + 75
	local function play_game(event)
		
		if event.phase == 'began' then
			button_menu.xScale = 0.7
			button_menu.yScale = 0.7
		elseif event.phase == 'ended' then
			button_menu.xScale = 1
			button_menu.yScale = 1
			display.remove( button_menu )
            display.remove( bk_menu )
            play()

		end
	end
	button_menu:addEventListener( "touch", play_game )

end
menu()

local function verify_status()

    if LOADING == "finish" then
        LOADING = "yes"
        menu()
    end
end   
Runtime:addEventListener( 'enterFrame', verify_status )