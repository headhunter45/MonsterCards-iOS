//
//  Skill+CoreDataClass.swift
//  MonsterCards
//
//  Created by Tom Hicks on 1/18/21.
//
//

import Foundation
import CoreData

@objc(Skill)
public class Skill: NSManagedObject {

    var wrappedName: String {
        get {
            return name ?? ""
        }
        set {
            name = newValue
        }
    }
    
    var wrappedProficiency: ProficiencyType {
        get {
            return ProficiencyType.init(rawValue: proficiency ?? "") ?? .none
        }
        set {
            proficiency = newValue.rawValue
        }
    }
        
    var wrappedAbilityScore: AbilityScore {
        get {
            return AbilityScore.init(rawValue: abilityScoreName ?? "") ?? .strength
        }
        set {
            abilityScoreName = newValue.rawValue
        }
    }
    
    var wrappedAdvantage: AdvantageType {
        get {
            return AdvantageType.init(rawValue: advantage ?? "") ?? .none
        }
        set {
            advantage = newValue.rawValue
        }
    }
}
