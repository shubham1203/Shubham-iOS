class Enemy {
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    
    func takeDamage(damage: Int) {
        health -= damage
    }
    
    func moveEnemy() {
        print("Enemy walks forward")
    }
    
    func attack() {
        print("Damage done: \(attackStrength)")
    }
}
