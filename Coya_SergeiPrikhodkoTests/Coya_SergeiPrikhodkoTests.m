//
//  Coya_SergeiPrikhodkoTests.m
//  Coya_SergeiPrikhodkoTests
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharactersModel.h"
#import <XCTest/XCTest.h>
@interface CharactersModel ()
- (void)addCharacteristicValueBonusesForCharacter:(CharacterEntity *)character;
- (void)addRaceBonusesForCharacter:(CharacterEntity *)character;
- (void)addClassBonusesForCharacter:(CharacterEntity *)character;
@end

@interface Coya_SergeiPrikhodkoTests : XCTestCase
@property (nonatomic, strong) CharactersModel *model;
@end

@implementation Coya_SergeiPrikhodkoTests

- (void)setUp
{
    [super setUp];
    self.model = [CharactersModel new];
}

- (void)tearDown
{
    self.model = nil;
    [super tearDown];
}

- (void)test_addCharacteristicValueBonuses
{
    CharacterEntity *character = [CharacterEntity new];
    character.strength = 4;
    character.dexterity = 7;
    character.constitution = 10;
    character.intelligence = 11;
    character.wisdom = 17;
    character.charisma = 24;

    [self.model addCharacteristicValueBonusesForCharacter:character];
    XCTAssert(character.strengthBonus == -3, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.dexterityBonus == -2, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.constitutionBonus == 0, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.intelligenceBonus == 0, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.wisdomBonus == 3, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.charismaBonus == 7, @"Wrong addCharacteristicValueBonusesForCharacter");
}

- (void)test_addRaceBonuses_Dwarf
{
    CharacterEntity *character = [CharacterEntity new];
    character.raceType = RaceTypeDwarf;

    [self.model addRaceBonusesForCharacter:character];
    XCTAssert(character.strengthBonus == 2, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.dexterityBonus == -2, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.constitutionBonus == 2, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.intelligenceBonus == 0, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.wisdomBonus == 0, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.charismaBonus == -2, @"Wrong addCharacteristicValueBonusesForCharacter");

    character.charisma = 24;

    [self.model addCharacteristicValueBonusesForCharacter:character];
    XCTAssert(character.charismaBonus == 5, @"Wrong addCharacteristicValueBonusesForCharacter");
}

- (void)test_addClassBonuses_Dwarf_Warrior
{
    CharacterEntity *character = [CharacterEntity new];
    character.classType = ClassTypeWarrior;
    character.raceType = RaceTypeDwarf;

    [self.model addRaceBonusesForCharacter:character];
    [self.model addClassBonusesForCharacter:character];
    XCTAssert(character.strengthBonus == 5, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.dexterityBonus == -2, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.constitutionBonus == 2, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.intelligenceBonus == 0, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.wisdomBonus == 0, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.charismaBonus == -2, @"Wrong addCharacteristicValueBonusesForCharacter");

    character.strength = 24;
    character.charisma = 24;

    [self.model addCharacteristicValueBonusesForCharacter:character];
    XCTAssert(character.strengthBonus == 12, @"Wrong addCharacteristicValueBonusesForCharacter");
    XCTAssert(character.charismaBonus == 5, @"Wrong addCharacteristicValueBonusesForCharacter");
}

@end
