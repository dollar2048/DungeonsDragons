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
};

typedef NS_ENUM(NSUInteger, ClassType) {
    ClassTypeWarrior,
    ClassTypeWizard,
    ClassTypeRanger,
};

@interface CharacterEntity : NSObject

@property (copy, nonatomic) NSString *name;
@property (nonatomic) RaceType raceType;
@property (nonatomic) ClassType classType;

@property (nonatomic) NSInteger strength;
@property (nonatomic) NSInteger dexterity;
@property (nonatomic) NSInteger constitution;
@property (nonatomic) NSInteger intelligence;
@property (nonatomic) NSInteger wisdom;
@property (nonatomic) NSInteger charisma;

@end
