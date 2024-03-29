//
//  MonsterDTO.swift
//  MonsterCards
//
//  Created by Tom Hicks on 3/28/21.
//

import Foundation

struct MonsterDTO {
    var name: String
    var type: String
    var alignment: String
    var size: String
    var hitDice: Int
    var armorName: String
    var otherArmorDesc: String
    var shieldBonus: Int
    var natArmorBonus: Int
    var speed: Int
    var burrowSpeed: Int
    var climbSpeed: Int
    var flySpeed: Int
    var hover: Bool
    var swimSpeed: Int
    var speedDesc: String
    var customSpeed: Bool
    var strPoints: Int
    var dexPoints: Int
    var conPoints: Int
    var intPoints: Int
    var wisPoints: Int
    var chaPoints: Int
    var cr: String
    var customCr: String
    var customProf: Int
    var hpText: String
    var sthrows: [SavingThrowDTO]
    var skills: [SkillDTO]
    var actions: [TraitDTO]
    var legendaryDescription: String
    var legendaries: [TraitDTO]
    var reactions: [TraitDTO]// TODO: verify this
    var abilities: [TraitDTO]
    var damageTypes: [DamageTypeDTO]
    var conditions: [DamageTypeDTO] // TODO: figure this out
    var languages: [LanguageDTO]
    var telepathy: Int
    var understandsBut: String
    var blindsight: Int
    var blind: Bool
    var darkvision: Int
    var tremorsense: Int
    var truesight: Int
    var tag: String
    var customHP: Bool
    var isLegendary: Bool
    var isLair: Bool
    var lairDescription: String
    var lairDescriptionEnd: String
    var isRegional: Bool
    var regionalDescription: String
    var regionalDescriptionEnd: String
//    var properties: [???] // TODO: figure this out
    var lairs: [TraitDTO]
    var regionals: [TraitDTO]
    var specialDamage: [DamageTypeDTO]
    var shortName: String
    var doubleColumns: Bool
    var separationPoint: Int
    var damage: [DamageTypeDTO] // TODO: figure this out
    
    init() {
        self.abilities = []
        self.actions = []
        self.alignment = ""
        self.armorName = ""
        self.blind = false
        self.blindsight = 0
        self.burrowSpeed = 0
        self.chaPoints = 0
        self.climbSpeed = 0
        self.conPoints = 0
        self.conditions = []
        self.cr = ""
        self.customCr = ""
        self.customHP = false
        self.customProf = 0
        self.customSpeed = false
        self.damage = []
        self.damageTypes = []
        self.darkvision = 0
        self.dexPoints = 0
        self.doubleColumns = false
        self.flySpeed = 0
        self.hitDice = 0
        self.hover = false
        self.hpText = ""
        self.intPoints = 0
        self.isLair = false
        self.isLegendary = false
        self.isRegional = false
        self.lairs = []
        self.languages = []
        self.legendaries = []
        self.lairDescription = ""
        self.legendaryDescription = ""
        self.lairDescriptionEnd = ""
        self.name = ""
        self.natArmorBonus = 0
        self.otherArmorDesc = ""
        self.reactions = []
        self.regionals = []
        self.regionalDescription = ""
        self.regionalDescriptionEnd = ""
        self.size = ""
        self.speed = 0
        self.skills = []
        self.sthrows = []
        self.strPoints = 0
        self.swimSpeed = 0
        self.speedDesc = ""
        self.shortName = ""
        self.specialDamage = []
        self.shieldBonus = 0
        self.separationPoint = 0
        self.type = ""
        self.tag = ""
        self.telepathy = 0
        self.truesight = 0
        self.tremorsense = 0
        self.understandsBut = ""
        self.wisPoints = 0
    }

}

enum MonsterDTOCodingKeys: String, CodingKey {
    case name = "name"
    case type = "type"
    case alignment = "alignment"
    case size = "size"
    case hitDice = "hitDice"
    case armorName = "armorName"
    case otherArmorDesc = "otherArmorDesc"
    case shieldBonus = "shieldBonus"
    case natArmorBonus = "natArmorBonus"
    case speed = "speed"
    case burrowSpeed = "burrowSpeed"
    case climbSpeed = "climbSpeed"
    case flySpeed = "flySpeed"
    case hover = "hover"
    case swimSpeed = "swimSpeed"
    case speedDesc = "speedDesc"
    case customSpeed = "customSpeed"
    case strPoints = "strPoints"
    case dexPoints = "dexPoints"
    case conPoints = "conPoints"
    case intPoints = "intPoints"
    case wisPoints = "wisPoints"
    case chaPoints = "chaPoints"
    case cr = "cr"
    case customCr = "customCr"
    case customProf = "customProf"
    case hpText = "hpText"
    case sthrows = "sthrows"
    case skills = "skills"
    case actions = "actions"
    case legendaryDescription = "legendaryDescription"
    case legendaries = "legendaries"
    case reactions = "reactions"
    case abilities = "abilities"
    case damageTypes = "damageTypes"
    case conditions = "conditions"
    case languages = "languages"
    case telepathy = "telepathy"
    case understandsBut = "understandsBut"
    case blindsight = "blindsight"
    case blind = "blind"
    case darkvision = "darkvision"
    case tremorsense = "tremorsense"
    case truesight = "truesight"
    case tag = "tag"
    case customHP = "customHP"
    case isLegendary = "isLegendary"
    case isLair = "isLair"
    case lairDescription = "lairDescription"
    case lairDescriptionEnd = "lairDescriptionEnd"
    case isRegional = "isRegional"
    case regionalDescription = "regionalDescription"
    case regionalDescriptionEnd = "regionalDescriptionEnd"
    case properties = "properties"
    case lairs = "lairs"
    case regionals = "regionals"
    case specialDamage = "specialDamage"
    case shortName = "shortName"
    case doubleColumns = "doubleColumns"
    case separationPoint = "separationPoint"
    case damage = "damage"
}

func readInt(_ container: KeyedDecodingContainer<MonsterDTOCodingKeys>, _ key: MonsterDTOCodingKeys, _ defaultValue: Int = 0) -> Int {
    let readInt = try? container.decode(Int.self, forKey: key)
    let readString = try? container.decode(String.self, forKey: key)
    if (readInt != nil) {
        return readInt!
    }
    if (readString != nil) {
        return Int(readString!) ?? defaultValue
    }
    
    return defaultValue;
}

func readString(_ container: KeyedDecodingContainer<MonsterDTOCodingKeys>, _ key: MonsterDTOCodingKeys, _ defaultValue: String = "") -> String {
    return (try? container.decode(String.self, forKey: key)) ?? defaultValue
}

extension MonsterDTO: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MonsterDTOCodingKeys.self)
        self.name = readString(container, .name, "Imported Monster")
        self.type = readString(container, .type, "")
        self.alignment = readString(container, .alignment, "")
        self.size = readString(container, .size, "")
        self.hitDice = readInt(container, .hitDice, 0)
        self.armorName = readString(container, .armorName, "")
        self.otherArmorDesc = readString(container, .otherArmorDesc, "")
        self.shieldBonus = readInt(container, .shieldBonus, 0)
        self.natArmorBonus = readInt(container, .natArmorBonus, 0)
        self.speed = readInt(container, .speed, 0)
        self.burrowSpeed = readInt(container, .burrowSpeed, 0)
        self.climbSpeed = readInt(container, .climbSpeed, 0)
        self.flySpeed = readInt(container, .flySpeed, 0)
        self.hover = (try? container.decode(Bool.self, forKey: .hover)) ?? false
        self.swimSpeed = readInt(container, .swimSpeed, 0)
        self.speedDesc = readString(container, .speedDesc, "")
        self.customSpeed = (try? container.decode(Bool.self, forKey: .customSpeed)) ?? false
        self.strPoints = readInt(container, .strPoints, 0)
        self.dexPoints = readInt(container, .dexPoints, 0)
        self.conPoints = readInt(container, .conPoints, 0)
        self.intPoints = readInt(container, .intPoints, 0)
        self.wisPoints = readInt(container, .wisPoints, 0)
        self.chaPoints = readInt(container, .chaPoints, 0)
        self.cr = readString(container, .cr, "")
        self.customCr = readString(container, .customCr, "")
        self.customProf = readInt(container, .customProf, 0)
        self.hpText = readString(container, .hpText, "")
        self.legendaryDescription = readString(container, .legendaryDescription, "")
        self.understandsBut = readString(container, .understandsBut, "")
        self.tag = readString(container, .tag, "")
        self.lairDescription = readString(container, .lairDescription, "")
        self.lairDescriptionEnd = readString(container, .lairDescriptionEnd, "")
        self.regionalDescription = readString(container, .regionalDescription, "")
        self.regionalDescriptionEnd = readString(container, .regionalDescriptionEnd, "")
        self.shortName = readString(container, .shortName, "")
        
        self.telepathy = readInt(container, .telepathy, 0)
        self.blindsight = readInt(container, .blindsight, 0)
        self.darkvision = readInt(container, .darkvision, 0)
        self.tremorsense = readInt(container, .tremorsense, 0)
        self.truesight = readInt(container, .truesight, 0)
        self.separationPoint = readInt(container, .separationPoint, 0)

        self.blind = (try? container.decode(Bool.self, forKey: .blind)) ?? false
        self.customHP = (try? container.decode(Bool.self, forKey: .customHP)) ?? false
        self.isLegendary = (try? container.decode(Bool.self, forKey: .isLegendary)) ?? false
        self.isLair = (try? container.decode(Bool.self, forKey: .isLair)) ?? false
        self.isRegional = (try? container.decode(Bool.self, forKey: .isRegional)) ?? false
        self.doubleColumns = (try? container.decode(Bool.self, forKey: .doubleColumns)) ?? false

        self.lairs = (try? container.decode([TraitDTO].self, forKey: .lairs)) ?? []
        self.regionals = (try? container.decode([TraitDTO].self, forKey: .regionals)) ?? []
        self.specialDamage = (try? container.decode([DamageTypeDTO].self, forKey: .specialDamage)) ?? []
        self.damage = (try? container.decode([DamageTypeDTO].self, forKey: .damage)) ?? []
        self.conditions = (try? container.decode([DamageTypeDTO].self, forKey: .conditions)) ?? []

        
        self.sthrows = (try? container.decode([SavingThrowDTO].self, forKey: .sthrows)) ?? []
        self.skills = (try? container.decode([SkillDTO].self, forKey: .skills)) ?? []
        self.actions = (try? container.decode([TraitDTO].self, forKey: .actions)) ?? []
        self.legendaries = (try? container.decode([TraitDTO].self, forKey: .legendaries)) ?? []
        self.reactions = (try? container.decode([TraitDTO].self, forKey: .reactions)) ?? []
        self.abilities = (try? container.decode([TraitDTO].self, forKey: .abilities)) ?? []
        self.damageTypes = (try? container.decode([DamageTypeDTO].self, forKey: .damageTypes)) ?? []
        self.languages = (try? container.decode([LanguageDTO].self, forKey: .languages)) ?? []
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MonsterDTOCodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.alignment, forKey: .alignment)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.hitDice, forKey: .hitDice)
        try container.encode(self.armorName, forKey: .armorName)
        try container.encode(self.otherArmorDesc, forKey: .otherArmorDesc)
        try container.encode(self.shieldBonus, forKey: .shieldBonus)
        try container.encode(self.natArmorBonus, forKey: .natArmorBonus)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.burrowSpeed, forKey: .burrowSpeed)
        try container.encode(self.climbSpeed, forKey: .climbSpeed)
        try container.encode(self.flySpeed, forKey: .flySpeed)
        try container.encode(self.hover, forKey: .hover)
        try container.encode(self.swimSpeed, forKey: .swimSpeed)
        try container.encode(self.speedDesc, forKey: .speedDesc)
        try container.encode(self.customSpeed, forKey: .customSpeed)
        try container.encode(self.strPoints, forKey: .strPoints)
        try container.encode(self.dexPoints, forKey: .dexPoints)
        try container.encode(self.conPoints, forKey: .conPoints)
        try container.encode(self.intPoints, forKey: .intPoints)
        try container.encode(self.wisPoints, forKey: .wisPoints)
        try container.encode(self.chaPoints, forKey: .chaPoints)
        try container.encode(self.cr, forKey: .cr)
        try container.encode(self.customCr, forKey: .customCr)
        try container.encode(self.customProf, forKey: .customProf)
        try container.encode(self.hpText, forKey: .hpText)
        try container.encode(self.sthrows, forKey: .sthrows)
        try container.encode(self.skills, forKey: .skills)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.legendaryDescription, forKey: .legendaryDescription)
        try container.encode(self.legendaries, forKey: .legendaries)
        try container.encode(self.reactions, forKey: .reactions)
        try container.encode(self.abilities, forKey: .abilities)
        try container.encode(self.damageTypes, forKey: .damageTypes)
        try container.encode(self.conditions, forKey: .conditions)
        try container.encode(self.languages, forKey: .languages)
        try container.encode(self.telepathy, forKey: .telepathy)
        try container.encode(self.understandsBut, forKey: .understandsBut)
        try container.encode(self.blindsight, forKey: .blindsight)
        try container.encode(self.blind, forKey: .blind)
        try container.encode(self.darkvision, forKey: .darkvision)
        try container.encode(self.tremorsense, forKey: .tremorsense)
        try container.encode(self.truesight, forKey: .truesight)
        try container.encode(self.tag, forKey: .tag)
        try container.encode(self.customHP, forKey: .customHP)
        try container.encode(self.isLegendary, forKey: .isLegendary)
        try container.encode(self.isLair, forKey: .isLair)
        try container.encode(self.lairDescription, forKey: .lairDescription)
        try container.encode(self.lairDescriptionEnd, forKey: .lairDescriptionEnd)
        try container.encode(self.isRegional, forKey: .isRegional)
        try container.encode(self.regionalDescription, forKey: .regionalDescription)
        try container.encode(self.regionalDescriptionEnd, forKey: .regionalDescriptionEnd)
        try container.encode([] as [TraitDTO], forKey: .properties)
        try container.encode(self.lairs, forKey: .lairs)
        try container.encode(self.regionals, forKey: .regionals)
        try container.encode(self.specialDamage, forKey: .specialDamage)
        try container.encode(self.shortName, forKey: .shortName)
        try container.encode(self.doubleColumns, forKey: .doubleColumns)
        try container.encode(self.separationPoint, forKey: .separationPoint)
        try container.encode(self.damage, forKey: .damage)
    }
}
