# AutoFFA

A lightweight addon for World of Warcraft 1.12.1 (Vanilla / Turtle WoW) that automatically sets loot to **Free-For-All** upon forming a party.

Built for use with **[ClassicAPI](https://github.com/brues-code/ClassicAPI)**, it leverages modern Lua 5.1 syntax and non-blocking asynchronous timers to update loot rules without background polling.

### How It Works
* **Initial Formation Trigger:** Fires strictly once on the transition from solo to a newly formed group. It sets loot to Free-For-All and completely steps aside.
* **Manual Override Friendly:** Does not continuously scan or enforce loot rules. Once formed, you are free to switch loot rules without the addon reverting your choice.

### Requirements
* World of Warcraft 1.12.1 (Vanilla or Turtle WoW client)
* **[ClassicAPI](https://github.com/brues-code/ClassicAPI)** DLL
