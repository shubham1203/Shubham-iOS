let skeleton = Enemy(health: 100, attackStrength: 10)
print(skeleton.health)
skeleton.attack()

let skeleton2 = Enemy(health: 100, attackStrength: 10)
print(skeleton2.health)
skeleton2.attack()

let dragon = Dragon(health: 200, attackStrength: 20)
dragon.talk(speech: "Fire")
dragon.moveEnemy() //overriden method
print(dragon.wingSpan) //child class property
print(dragon.attackStrength) //parent class property
dragon.attack() //super+subclass methods both called

//Pass reference example
let goblin = Enemy(health: 120, attackStrength: 15)
let gremlin = goblin

goblin.takeDamage(damage: 12)
print("Goblin health: \(goblin.health)")
print("Gremlin health: \(gremlin.health)")
