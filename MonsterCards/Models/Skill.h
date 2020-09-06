//
//  Skill.h
//  MonsterCards
//
//  Created by Tom Hicks on 9/4/20.
//  Copyright © 2020 Tom Hicks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Monster.h"

NS_ASSUME_NONNULL_BEGIN
@class Monster;

@interface Skill : NSObject

@property NSString* name;
@property NSString* abilityScoreName;
@property NSString* notes;

-(id)initWithName: (NSString*)name abilityScoreName:(NSString*)abilityScoreName andNotes:(NSString*)notes;
-(int)skillBonusForMonster: (Monster*)monster;
-(NSString*)textForMonster: (Monster*)monster;

@end

NS_ASSUME_NONNULL_END