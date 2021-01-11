Original script: iTexZoz
Edited by: JackTheDev
Neon Lights script: 13StewartC

Script Terms Of Service: 

• You must follow the guidelines set out by iTexZoz
• You must follow the Free Mode Designs Terms Of Service when using,
• If you plan on editing this menu and using it somewhere else, please follow these:
 - Credit must be given where credit is due. E.G:
    - Original script: iTexZoz
    - Edited by: JackTheDev and {YOUR NAME}
• You are allowed to change the script to suite your needs, I (JackTheDev) have made a video explaining how to edit the script: 
 - https://youtu.be/ZBh3BU1O9Uc


# How to edit parts of the script # 

 - 1. How to change the name of the file
     • Change the name of "velocity.lua" to what ever you want while leaving the ".lua" at the end. Then go into the "fxmanifest.lua" and change
       the client script from "velocity.lua" to "{YOUR NAME}.lua".

 - 2. How to change the spawn code for the first button
     • To change the spawn code, go into velocity.lua and head to line 40: 
        local veh = "velocity"
       Here, remove "velocity" and replace it with the spawn code your vehicle has. The code will then do everything else.

 - 3. How to change the extras.
     • To change extras, go to the RageUI.List and under that you will find a list of extras, there you can copy and past up to 12 lines. 
       The "Value = 1" represents the extra. E.G:
         Extra 1: Value = 1
         Extra 2: Value = 2
         etc
       Then you can change the name of the extra in the menu by changing the value in: 
         "Name = "All Doors Closed"
       There it will change and you let the code do the rest of the work.

 - 4. How to change the door that rolls up
     • Go into velocity.lua and head to line 92, from there you will need to input 2 new values. Where you see these two lines:
         local closed = GetVehicleDoorAngleRatio(vehic, 5) < 0.1   (Line 96)
         SetVehicleDoorOpen(vehic, 5, false, false)                (Line 99)
       Here you will change the numebr 5 to a different number, the native is below: 
          0 = Front Left Door  
          1 = Front Right Door  
          2 = Back Left Door  
          3 = Back Right Door  
          4 = Hood  
          5 = Trunk  
          6 = Back  
          7 = Back2 
      You must follow these to get it to work.

 - 5. How to remove different section
     • To remove different section, start where you see "RageUI.{OPTION}" and go down to end })and delete all.

 - 6. How to change the text in the seperator
     • To change the seperator go to line 131 and change the value inside "RageUI.Seperator("Made By JackTheDev")".

 - 7. How to change the keybind
     • To change the keybind, go to line 138 and replace "F10" with any other key you want, E.G. P


If you have any questions about the script, please feel free to message me on discord at JackTheDev#3347 or join the discord at https://discord.gg/qctjvW6
