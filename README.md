# KOTOR2-Loot-Overhaul
An effort to improve the random loot system in _Star Wars: Knights of the Old Republic II - The Sith Lords_

Changes:
- Most random number rolls have been replaced with a new dice mechanic. The roll is still skewed based on the player's level, but it should now result in a wider variety of items.
- Each type of item has been given a custom script function. The specifics vary, tailored to each item type, but generally they adjust the probabilities to distribute items more logically (e.g. standard lightsabers are more common than double-bladed lightsabers) and replace items with higher-quality ones when they are available (e.g. the Watchman Blaster is replaced by the Elite Watchman Blaster if the player's level is high enough).
- Many robes were left out of random loot. It was not possible to roll any higher than 15, so it was nearly impossible to find most of the higher-quality robes anywhere in the game.
- The rare item roll gave a 95% chance of rolling the highest possible value. I'm not sure what the intent was, but I doubt that was it. You're still guaranteed to find a rare item for every fifth item found, but now it will likely be that fifth item instead of the third.
- When rolling a rare item, it was possible to roll *too* high and receive no item at all.
- Strength Gauntlets have been restored. Previously there was no 3rd glove variation, so random loot would give nothing in its place.
- The Vao Armband has been restored via random loot.
- The Vibrocutter and Guidon Beacon have been restored via random loot.
- The Baran Do Advisor Robes have been restored via random loot.
- It was only possible to receive 5 out of 11 of Mira's rockets through random loot.
- It was possible to collect multiple copies of what ought to be unique items (e.g. Exar Kun's Light Battle Suit, Circlet of Saresh). The random loot system will now keep track of which items you've found and won't give duplicates of unique items.
- It was not possible to receive Battle Stimulants through random loot.
- Random loot would only give Security Tunnelers and never the higher-quality Security Spike Tunnelers. There is now a chance of receiving them at higher levels.
- It is no longer possible to receive Clothing (a_robe_01) through random loot. When rolled, it is replaced with a robe item that has actual value.
- It is no longer possible to find blasters on Peragus through random loot, what with the ban on them. All weapons there have been replaced by a selection of Peragus-specific items (Mining Laser, Advanced Mining Laser, and the restored Vibrocutter and Guidon Beacon)
- Pergaus items have had their stats unified across all areas. They will also now stack in the inventory menu.
- It is no longer possible to find a Breath Mask in the Peragus dormitories via random loot. There is one placed there manually already, so it didn't make sense with the design.
- It is no longer possible to find robes on Peragus through random loot. The level scale for robes has been adjusted to account for this, so once you do start finding robes, the lower-numbered items won't be skipped.
- Blaster and melee upgrades have been removed from Peragus loot; upgradeable weapons were unlikely in the original loot system and impossible in the new one. Armor overlays have also been removed, as they cannot be installed in the miner uniform and other armor is excluded early on. In their place, the probability of equipment items has been increased and Peragus weapons have been added.
- Light armor has been removed from Jedi loot and replaced with power crystals.
- Components and Chemicals have been removed from random loot found late in the game, as there are few workbenches and no lab stations available at that point. Stimulants are no longer excluded.

To Do:
- [x] Clean up code
- [x] Re-read 3500+ lines of code to double-check everything
- [x] Provision for unique items that doesn't rely on globals
- [x] Alignment restrictions for Jedi robes
- [ ] Merchant & spawn script support (won't decompile currently)
