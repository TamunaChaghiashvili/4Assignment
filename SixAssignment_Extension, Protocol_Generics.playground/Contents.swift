
import Foundation

// 1. პირველი დავალება - Enemy
class SuperEnemy {
    var name: String
    var hitPoints: Int
    
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
      
    }
}

// მეორე დავალება - Superhero
protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get set }
    
    func attack(target: SuperEnemy) -> Int
    func performSuperPower(target: SuperEnemy) -> Int
}


//3. extension

extension Superhero {
    func printSuperheroInfo() {
        print("Superhero: \(name)")
        print("Alias: \(alias)")
        print("Is Evil: \(isEvil)")
        print("Superpowers: \(superPowers)")
    }
    
    func printSuperPowers() {
        for (power, damage) in superPowers {
            print("\(power) - Damage: \(damage)")
        }
    }
}


// 4. SuperMan
struct SpiderMan: Superhero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String: Int]
    
//    init(name: String, alias: String) {
//        self.name = name
//        self.alias = alias
//        self.isEvil = false
//    }
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    // აქ მაძლევს ერორს სულ, mutating რომ გადამაქვს, მერე სტრუქტურაზე მიერორდება და ვერ ვხვდები რატომ მაქვს ასე
    
    func performSuperPower(target: SuperEnemy) -> Int {
        let sortedPowers = superPowers.sorted { $0.value > $1.value }
        if let (power, damage) = sortedPowers.first {
            superPowers.removeValue(forKey: power)
            target.hitPoints -= damage
        }
        return target.hitPoints
    }
}



//5. SuperherSquad

class SuperheroSquad<T: Superhero> {
    var superheroes: [T]
    
    init(superheroes: [T]) {
        self.superheroes = superheroes
    }
    
    func listSuperheroes() {
        for hero in superheroes {
            hero.printSuperheroInfo()
            print()
        }
    }
    
    
    
// 6. simulation
    func simulateShowdown(enemy: SuperEnemy) {
        while enemy.hitPoints > 0 {
            for hero in superheroes {
                if !hero.superPowers.isEmpty {
                    let remainingLife = hero.performSuperPower(target: enemy)
                    print("\(hero.name) used a superpower. \(enemy.name) now has \(remainingLife) hit points.")
                } else {
                    let remainingLife = hero.attack(target: enemy)
                    print("\(hero.name) made a normal attack. \(enemy.name) now has \(remainingLife) hit points.")
                }
            }
            
            if enemy.hitPoints <= 0 {
                print("\(enemy.name) has been defeated!")
                break
            }
        }
        
        print("Battle Finished!")
    }
}

let spiderman = SpiderMan(name: "Peter Parker", alias: "Marvel", isEvil: false, superPowers: ["Web": 30, "Sense": 15])
let spiderCat = SpiderMan(name: "spiderCat", alias: "`Marvel`", isEvil: false, superPowers: ["Fights": 35, "Flight": 20])

let squad = SuperheroSquad(superheroes: [spiderman, spiderCat ])


squad.listSuperheroes()



