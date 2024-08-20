class Dragon: Enemy {
    var wingSpan = 10
    
    func talk(speech: String) {
        print("Says \(speech)")
    }
    
    //here override keyword is used to override the moveEnemy function in parent, so if we call dragon.moveEnemy, then this method gets executed instead of parent
    override func moveEnemy() {
        print("Fly forward")
    }
    
    override func attack() {
        super.attack()
        print("Spits Fire")
    }
}
