//1. პირველი დავალება

import Foundation

//cargo managment
protocol CargoManaging {
    func addCargoItem(_ item: String)
    func removeCargoItem(_ item: String)
    func listCargoItems() -> [String]
}

// Cargo manager
class CargoManager: CargoManaging {
    var cargo: [String] = []

    func addCargoItem(_ item: String) {
        cargo.append(item)
    }

    func removeCargoItem(_ item: String) {
        if let i = cargo.firstIndex(of: item) {
            cargo.remove(at: i)
        }
    }

    func listCargoItems() -> [String] {
         cargo
    }
}

// crew managment protocol
protocol CrewManaging {
    func addCrewMember(_ member: String)
    func removeCrewMember(_ member: String)
    func listCrewMembers() -> [String]
}

// crew managment
class CrewManager: CrewManaging {
    var crew: [String] = []

    func addCrewMember(_ member: String) {
        crew.append(member)
    }

    func removeCrewMember(_ member: String) {
        if let i = crew.firstIndex(of: member) {
            crew.remove(at: i)
        }
    }

    func listCrewMembers() -> [String] {
         crew
    }
}

// Cannons
protocol Cannons {
    func fireCannon(count: Int)
}

//  PirateShip
class PirateShip: Cannons {
    var name: String
    var cannonsCount: Int
    var crewManager: CrewManaging
    var cargoManager: CargoManaging

    init(name: String, cannonsCount: Int, crewManager: CrewManaging, cargoManager: CargoManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.crewManager = crewManager
        self.cargoManager = cargoManager
    }

    func addCrew(member: String) {
        crewManager.addCrewMember(member)
    }

    func removeCrew(member: String) {
        crewManager.removeCrewMember(member)
    }

    func listCrew() -> [String] {
        return crewManager.listCrewMembers()
    }

    func addCargo(item: String) {
        cargoManager.addCargoItem(item)
    }

    func removeCargo(item: String) {
        cargoManager.removeCargoItem(item)
    }

    func listCargo() -> [String] {
        return cargoManager.listCargoItems()
    }

    func cannonCount() -> Int {
        return cannonsCount
    }

    func fireCannon(count: Int) {
        if count > 0 && count <= cannonsCount {
            print("\(count) cannon(s) fired from \(name)!")
            
        } else {
            print("Not enough cannons to fire.")
        }
    }
}

// ეს ნაწილი ვერ გავმართე და მერე შენს კოდს შეადარე და არაა ჩემი კარგად
class Frigate: PirateShip {
    
    var CannonsCount: Int = 10

    override func cannonCount() -> Int {
        return cannonsCount
    }

    override func fireCannon(count: Int) {
        if count > 0 && count <= cannonsCount {
            print("\(count) cannon(s) fired from \(name)!")
            
        } else {
            print("Not enough cannons to fire.")
        }
    }
}

// იგივეა აქაც -ეს მგონი ვერ გავიგე
class Galleon: PirateShip {
    
    var CannonsCount: Int = 20

    override func cannonCount() -> Int {
        return cannonsCount
    }

    override func fireCannon(count: Int) {
        if count > 0 && count <= cannonsCount {
            print("\(count) cannon(s) fired from \(name)!")
            
        } else {
            print("Not enough cannons to fire.")
        }
    }
}


//2. მეორე დავალება

class TreasureMap {
    private let treasureX: Int
    private let treasureY: Int
    
    init(treasureX: Int, treasureY: Int) {
        self.treasureX = treasureX
        self.treasureY = treasureY
    }
    func hintToTreasure(x: Int, y: Int) {
        if x == treasureX && y == treasureY {
            print("You've found the treasure!")
        } else {
            if x < treasureX {
                print("Go right to find the treasure.")
            } else {
                print("Go left to find the treasure.")
            }
            if y < treasureY {
                print("Go up to find the treasure.")
            } else {
                print("Try going in a different direction to find the treasure.")
            }
        }
    }
}
    
    
    
//3. მესამე დავალება
    
    class SeaAdventure {
        let adventureType: String
    
        init(adventureType: String) {
            self.adventureType = adventureType
        }
    
        func encounter() {
            print("Our ship encountered a \(adventureType) adventure!")
        }
    }
    
    
//4. მეოთხე ამოცანა

    
    class PirateCode {
        private func discussTerms(term: String) {
            print("Pirates are discussing the terms: \(term)")
        }
    
        func parley(term: String) {
            discussTerms(term: term)
            print("Parley: Pirates have reached an agreement on \(term).")
        }
    
        func mutiny(term: String) {
            discussTerms(term: term)
            print("Mutiny: Pirates have rebelled against the terms of \(term).")
        }
    }
    

    let code = PirateCode()
    code.parley(term: "sharing the booty")
    code.mutiny(term: "the captain's authority")
    

