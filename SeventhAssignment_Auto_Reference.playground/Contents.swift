import Foundation

// StationModule

class StationModule {
    let moduleName: String
    var drone: Drone?
    
    init(moduleName: String) {
        self.moduleName = moduleName
    }
    
    func assignDrone(drone: Drone) {
        self.drone = drone
        drone.assignedModule = self
    }
    
    func performModuleAction() {
        print("Module \(moduleName) is performing its action.")
    }
}

// 2. Control Center

class ControlCenter: StationModule {
    private var isLockedDown: Bool = false
    private var securityCode: String = "12345"
    
    func lockdown(withPassword password: String) {
        if password == securityCode {
            isLockedDown = true
            print("Control Center is locked down.")
        } else {
            print("Incorrect password. Lockdown failed.")
        }
    }
}


// ResearchLab

class ResearchLab: StationModule {
    private var samples: [String] = []
    
    func addSample(sample: String) {
        samples.append(sample)
    }
    
    func listSamples() {
        print("Samples in Research Lab: \(samples)")
    }
}


//LifeSupportSystem

class LifeSupportSystem: StationModule {
    private var oxygenLevel: Int = 100
    
    func checkOxygenStatus() {
        print("Oxygen level: \(oxygenLevel)%")
    }
    
    func adjustOxygenLevel(level: Int) {
        oxygenLevel = level
        print("Oxygen level adjusted to \(level)%")
    }
}

// Drone

class Drone {
    var moduleName: String
    weak var missionControlLink: MissionControl?
    unowned var assignedModule: StationModule
    
    init(moduleName: String, assignedModule: StationModule) {
        self.moduleName = moduleName
        self.assignedModule = assignedModule
    }
    
    func performTask(task: String) {
        print("\(moduleName) is performing task: \(task)")
    }
}


// OrbitStation

class OrbitronSpaceStation {
     let controlCenter: ControlCenter
     let researchLab: ResearchLab
     let lifeSupportSystem: LifeSupportSystem
    
    init() {
        controlCenter = ControlCenter(moduleName: "Control Center")
        researchLab = ResearchLab(moduleName: "Research Lab")
        lifeSupportSystem = LifeSupportSystem(moduleName: "Life Support System")
        
      
        let controlCenterDrone = Drone(moduleName: "Control Center Drone", assignedModule: controlCenter)
        let researchLabDrone = Drone(moduleName: "Research Lab Drone", assignedModule: researchLab)
        let lifeSupportDrone = Drone(moduleName: "Life Support Drone", assignedModule: lifeSupportSystem)
        
        controlCenter.assignDrone(drone: controlCenterDrone)
        researchLab.assignDrone(drone: researchLabDrone)
        lifeSupportSystem.assignDrone(drone: lifeSupportDrone)
    }
    
    func lockdownControlCenter(withPassword password: String) {
        controlCenter.lockdown(withPassword: password)
    }
    
    func activate() {
     
        controlCenter.performModuleAction()
        researchLab.addSample(sample: "Sample A")
        researchLab.listSamples()
        lifeSupportSystem.checkOxygenStatus()
        

        controlCenter.drone?.performTask(task: "Monitor Systems")
        researchLab.drone?.performTask(task: "Collect Data")
        lifeSupportSystem.drone?.performTask(task: "Maintain Oxygen Levels")
    }
}


// MissionControl

class MissionControl {
     var spaceStation: OrbitronSpaceStation?
    
    func connect(to spaceStation: OrbitronSpaceStation) {
        self.spaceStation = spaceStation
    }
    
    func requestControlCenterStatus() {
        spaceStation?.lockdownControlCenter(withPassword: "12345")
    }
    
    func requestOxygenStatus() {
        spaceStation?.activate()
    }
    
    func requestDroneStatus(moduleName: String) {
        spaceStation?.controlCenter.drone?.performTask(task: "Check Module \(moduleName)")
    }
}


let spaceStation = OrbitronSpaceStation()
let missionControl = MissionControl()
missionControl.connect(to: spaceStation)

missionControl.requestControlCenterStatus()
missionControl.requestOxygenStatus()
missionControl.requestDroneStatus(moduleName: "Life Support System")
