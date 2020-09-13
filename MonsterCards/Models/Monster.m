//
//  Monster.m
//  MonsterCards
//
//  Created by Tom Hicks on 9/4/20.
//  Copyright © 2020 Tom Hicks. All rights reserved.
//

#import "Monster.h"
#import "StringHelper.h"

@implementation Monster

@synthesize blindsightDistance;
@synthesize burrowSpeed;
@synthesize challengeRating;
@synthesize climbSpeed;
@synthesize customChallengeRating;
@synthesize customHP;
@synthesize customProficiencyBonus;
@synthesize customSpeed;
@synthesize customSpeedDescription;
@synthesize darkvisionDistance;
@synthesize flySpeed;
@synthesize hitDice;
@synthesize hover;
@synthesize hpText;
@synthesize isBlind;
@synthesize naturalArmorBonus;
@synthesize shieldBonus;
@synthesize speed;
@synthesize swimSpeed;
@synthesize telepathy;
@synthesize tremorsenseDistance;
@synthesize truesightDistance;
@synthesize understandsBut;

+(int)abilityModifierForScore: (int)score {
    return (int)floor((score - 10) / 2.0);
}

+(int)hitDieForSize: (NSString*)size{
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(id)init {
    self = [super init];
        
    self.name = @"";
    self.size = @"";

    return self;
}

-(id)initWithJSONString: (NSString*)jsonString andContext:(NSManagedObjectContext*)context {
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [self initWithJSONData:jsonData andContext:context];
}

-(id)initWithJSONData: (NSData*)jsonData andContext:(NSManagedObjectContext*)context {
    self = [self initWithContext:context];
    
    NSDictionary *jsonRoot = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    NSNumber *tempNumber;
    
    self.name = [jsonRoot objectForKey:@"name"] ?: @"";
    self.size = [jsonRoot objectForKey:@"size"] ?: @"";
    self.type = [jsonRoot objectForKey:@"type"] ?: @"";
    self.subtype = [jsonRoot objectForKey:@"tag"] ?: @"";
    self.alignment = [jsonRoot objectForKey:@"alignment"] ?: @"";
    self.armorName = [jsonRoot objectForKey:@"armorName"] ?: @"";
    self.otherArmorDescription = [jsonRoot objectForKey:@"otherArmorDesc"] ?: @"";
    tempNumber = [jsonRoot objectForKey:@"strPoints"];
    if (tempNumber != nil && [tempNumber isKindOfClass:[NSNumber class]]) {
        self.strengthScore = tempNumber.intValue;
    }
    tempNumber = [jsonRoot objectForKey:@"dexPoints"];
    if (tempNumber != nil && [tempNumber isKindOfClass:[NSNumber class]]) {
        self.dexterityScore = tempNumber.intValue;
    }
    tempNumber = [jsonRoot objectForKey:@"conPoints"];
    if (tempNumber != nil && [tempNumber isKindOfClass:[NSNumber class]]) {
        self.constitutionScore = tempNumber.intValue;
    }
    tempNumber = [jsonRoot objectForKey:@"intPoints"];
    if (tempNumber != nil && [tempNumber isKindOfClass:[NSNumber class]]) {
        self.intelligenceScore = tempNumber.intValue;
    }
    tempNumber = [jsonRoot objectForKey:@"wisPoints"];
    if (tempNumber != nil && [tempNumber isKindOfClass:[NSNumber class]]) {
        self.wisdomScore = tempNumber.intValue;
    }
    tempNumber = [jsonRoot objectForKey:@"chaPoints"];
    if (tempNumber != nil && [tempNumber isKindOfClass:[NSNumber class]]) {
        self.charismaScore = tempNumber.intValue;
    }

    return self;
}

-(id)initWithMonster:(Monster* _Nonnull)monster {
    self = [self initWithContext:monster.managedObjectContext];
    
    [self copyFromMonster:monster];
    
    return self;
}

-(NSString*)meta {
    //"${size} ${type} (${subtype}) ${alignment}"

    NSMutableArray *parts = [NSMutableArray arrayWithCapacity:4];
    if (![StringHelper isStringNilOrEmpty:self.size]) {
        [parts addObject:self.size];
    }
    
    if (![StringHelper isStringNilOrEmpty:self.type]) {
        [parts addObject:self.type];
    }
    
    if (![StringHelper isStringNilOrEmpty:self.subtype]) {
        [parts addObject:[NSString stringWithFormat:@"(%@)", self.subtype]];
    }
    
    if (![StringHelper isStringNilOrEmpty:self.alignment]) {
        [parts addObject:self.alignment];
    }
    
    return [parts componentsJoinedByString:@" "];
}

-(int)abilityScoreForAbilityScoreName: (NSString*)abilityScoreName {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(int)abilityModifierForAbilityScoreName: (NSString*)abilityScoreName {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(int)strengthModifier {
    return [Monster abilityModifierForScore:self.strengthScore];
}

-(int)dexterityModifier {
    return [Monster abilityModifierForScore:self.dexterityScore];
}

-(int)constitutionModifier {
    return [Monster abilityModifierForScore:self.constitutionScore];
}

-(int)intelligenceModifier {
    return [Monster abilityModifierForScore:self.intelligenceScore];
}

-(int)wisdomModifier {
    return [Monster abilityModifierForScore:self.wisdomScore];
}

-(int)charismaModifier {
    return [Monster abilityModifierForScore:self.charismaScore];
}


//getArmorClass
-(NSString*)armorClassDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

//getHitPoints
-(NSString*)hitPointsDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

//getSpeedText
-(NSString*)speedDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)strengthDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)dexterityDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)constitutionDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)intelligenceDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)wisdomDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)charismaDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSSet*)savingThrows {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addSavingThrow: (SavingThrow*)savingThrow {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)remvoeSavingThrow: (SavingThrow*)savingThrow {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearSavingThrows {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)savingThrowsDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(int)proficiencyBonus {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addSkill: (Skill*)skill {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)removeSkill: (Skill*)skill {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearSkills {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)skillsDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addDamageType: (DamageType*)damageType {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)removeDamageType: (DamageType*)damageType {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearDamageTypes {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)damageImmunitiesDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)damageResistancesDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)damageVulnerabilitiesDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addConditionImmunity: (NSString*)condition {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)removeConditionImmunity: (NSString*)condition {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearConditionImmunities {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)conditionImmunitiesDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)sensesDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addLanguage: (Language*)language {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)removeLanguage: (Language*)language {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearLanguages {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)languagesDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)challengeRatingDescription {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addAbility: (Ability*)ability {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)removeAbility: (Ability*)ability {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearAbilities {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSArray*)abilityDescriptions {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)addAction: (Action*)action {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)removeAction: (Action*)action {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)clearActions {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSArray*)actionDescriptions {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(NSString*)placeholderReplacedText: (NSString*)text {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(int)savingThrowForAbilityScoreName: (NSString*)abilityScoreName {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(int)spellSaveDCForAbilityScoreName: (NSString*)abilityScoreName {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(int)attackBonusForAbilityScoreName: (NSString*)abilityScoreName {
    @throw [[NSException alloc] initWithName:@"unimplemented" reason:@"Method not implemented." userInfo:nil];
}

-(void)copyFromMonster:(Monster*)monster {
    self.name = monster.name;
    self.size = monster.size;
    self.type = monster.type;
    self.subtype = monster.subtype;
    self.alignment = monster.alignment;
    self.strengthScore = monster.strengthScore;
    self.dexterityScore = monster.dexterityScore;
    self.constitutionScore = monster.constitutionScore;
    self.intelligenceScore = monster.intelligenceScore;
    self.wisdomScore = monster.wisdomScore;
    self.charismaScore = monster.charismaScore;
    self.armorName = monster.armorName;
    self.otherArmorDescription = monster.otherArmorDescription;
}

@end
