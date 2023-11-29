local startTime = os.time()
local use12hr = false

return function (dt)
    ui.drawRectFilled(0, ui.windowSize(), rgbm.colors.black)
    system.scrollList(dt, function ()

      local totalSeconds = math.floor(sim.timeTotalSeconds)
      local hours = math.floor(totalSeconds / 3600)
      hours = hours % 24
      local minutes = math.floor((totalSeconds % 3600) / 60)
      local seconds = totalSeconds % 60
      
      local currentDateAndTime = os.date(use12hr and "%I:%M:%S %p" or "%H:%M:%S")


      local currentTime = os.time()
      local elapsedTime = currentTime - startTime
      local elHours = math.floor(elapsedTime / 3600)
      local elMin = math.floor((elapsedTime % 3600) / 60)
      local elSecs = elapsedTime % 60

      if use12hr then
        elHours = elHours % 12
        hours = hours % 12
      end

      ui.offsetCursorY(40)
      ui.dwriteText("Players: " .. sim.carsCount, 50)
      ui.dwriteText("In-Game Time: " .. string.format("%02d", hours) .. ":" .. string.format("%02d", minutes) .. ":" .. string.format("%02d", seconds), 50)
      ui.dwriteText("Local Time: " .. currentDateAndTime, 50)
      ui.dwriteText("Playing For: " .. string.format("%02d", elHours) .. ":" .. string.format("%02d", elMin) .. ":" .. string.format("%02d", elSecs), 50)
      ui.dwriteText("Use 12 hour format?", 15)
      
      if touchscreen.toggle('toggle12hr', use12hr, vec2(80, 40)) then use12hr = not use12hr end
    end)
end
