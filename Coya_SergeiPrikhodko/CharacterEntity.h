//
//  CharacterEntity.h
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RaceType) {
    RaceTypeDwarf,
    RaceTypeElf,
    RaceTypeHuman,
    RaceTypeCount,
};

typedef NS_ENUM(NSUInteger, ClassType) {
    ClassTypeWarrior,
    ClassTypeWizard,
    ClassTypeRanger,
    ClassTypeCount,
};

@interface CharacterEntity : NSObject

@property (copy, nonatomic) NSString *name;
@property (nonatomic) RaceType raceType;
@property (nonatomic) ClassType classType;

@property (nonatomic) NSInteger strength;
@property (nonatomic) NSInteger strengthBonus;
@property (nonatomic) NSInteger dexterity;
@property (nonatomic) NSInteger dexterityBonus;
@property (nonatomic) NSInteger constitution;
@property (nonatomic) NSInteger constitutionBonus;
@property (nonatomic) NSInteger intelligence;
@property (nonatomic) NSInteger intelligenceBonus;
@property (nonatomic) NSInteger wisdom;
@property (nonatomic) NSInteger wisdomBonus;
@property (nonatomic) NSInteger charisma;
@property (nonatomic) NSInteger charismaBonus;

@property (nonatomic, readonly) NSInteger power;

@end
