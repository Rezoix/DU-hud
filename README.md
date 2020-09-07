# Dual Universe HUD

**!!!WORK IN PROGRESS!!!**


**May not work with seats at the moment, use a programming board**

**Does not work in cockpits**

## Installation
* Paste **hud.lua** code into `system->start()`
* Paste `system.showScreen(0)` into `system->stop()`
* Choose between updater 
    1. `system->update()` where hud refreshes every frame
        * Paste `updateHud()` into `system->update()`
    2. `unit->tick()` where hud refresh rate can be chosen
        * Paste `unit.setTimer("updateHud", 1/x)` into `unit->start()`. For example `unit.setTimer("updateHud", 1/30)` has refresh rate of 30 times a second
        * Create `unit->tick(updateHud)` event and paste `updateHud()` into it
