//
//  JSONHelper.h
//  MonsterCards
//
//  Created by Tom Hicks on 9/15/20.
//  Copyright © 2020 Tom Hicks. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSONHelper : NSObject

+(NSString*)readStringFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key;
+(NSString*)readStringFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key withDefaultValue:(NSString* _Nullable)defaultValue;
+(NSNumber*)readNumberFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key;
+(NSNumber*)readNumberFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key withDefaultValue:(NSNumber* _Nullable)defaultValue;
+(int)readIntFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key;
+(int)readIntFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key withDefaultValue:(int)defaultValue;
+(BOOL)readBoolFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key;
+(BOOL)readBoolFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key withDefaultValue:(BOOL)defaultValue;
+(NSDictionary*)readDictionaryFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key;
+(NSDictionary*)readDictionaryFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key withDefaultValue:(NSDictionary* _Nullable)defaultValue;
+(NSArray*)readArrayFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key;
+(NSArray*)readArrayFromDictionary:(NSDictionary*)dictionary forKey:(NSString*)key withDefaultValue:(NSArray* _Nullable)defaultValue;

+(NSString*)readStringFromArray:(NSArray*)array forIndex:(NSUInteger)index;
+(NSString*)readStringFromArray:(NSArray*)array forIndex:(NSUInteger)index withDefaultValue:(NSString* _Nullable)defaultValue;
+(NSNumber*)readNumberFromArray:(NSArray*)array forIndex:(NSUInteger)index;
+(NSNumber*)readNumberFromArray:(NSArray*)array forIndex:(NSUInteger)index withDefaultValue:(NSNumber* _Nullable)defaultValue;
+(int)readIntFromArray:(NSArray*)array forIndex:(NSUInteger)index;
+(int)readIntFromArray:(NSArray*)array forIndex:(NSUInteger)index withDefaultValue:(int)defaultValue;
+(BOOL)readBoolFromArray:(NSArray*)array forIndex:(NSUInteger)index;
+(BOOL)readBoolFromArray:(NSArray*)array forIndex:(NSUInteger)index withDefaultValue:(BOOL)defaultValue;
+(NSDictionary*)readDictionaryFromArray:(NSArray*)array forIndex:(NSUInteger)index;
+(NSDictionary*)readDictionaryFromArray:(NSArray*)array forIndex:(NSUInteger)index withDefaultValue:(NSDictionary* _Nullable)defaultValue;
+(NSArray*)readArrayFromArray:(NSArray*)array forIndex:(NSUInteger)index;
+(NSArray*)readArrayFromArray:(NSArray*)array forIndex:(NSUInteger)index withDefaultValue:(NSArray* _Nullable)defaultValue;

+(id)parseJSONString:(NSString*)jsonString;
+(NSDictionary*)parseJSONStringAsDictionary:(NSString*)jsonString;
+(NSArray*)parseJSONStringAsArray:(NSString*)jsonString;

+(id)parseJSONData:(NSData*)jsonData;
+(NSDictionary*)parseJSONDataAsDictionary:(NSData*)jsonData;
+(NSArray*)parseJSONDataAsArray:(NSData*)jsonData;

@end

NS_ASSUME_NONNULL_END
