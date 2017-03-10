//
//  CharactersModel.m
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharactersModel.h"

const NSInteger kCharactersAmount = 100;
const NSInteger kNumberOfRollings = 4;
const NSInteger kNumberOfDices = 6;

@interface CharactersModel ()

@property (strong, nonatomic, readwrite) NSArray<CharacterEntity *> *characters;

@end

@implementation CharactersModel

- (NSArray<CharacterEntity *> *)characters
{
    if (!_characters)
    {
        self.characters = [self generateCharacterListFor:kCharactersAmount];
    }
    return _characters;
}

#pragma mark - Private

- (NSArray<CharacterEntity *> *)generateCharacterListFor:(NSInteger)amount
{
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:amount];

    for (int i = 0; i < amount; i++)
    {
        CharacterEntity *character = [CharacterEntity new];
        character.name = @"Name";
        character.raceType = arc4random_uniform(RaceTypeCount);
        character.classType = arc4random_uniform(ClassTypeCount);

        character.strength = [self randomCharacteristicValue];
        character.strengthBonus = [self strengthBonusForCharacter:character];

        character.dexterity = [self randomCharacteristicValue];
        character.dexterityBonus = [self dexterityBonusForCharacter:character];

        character.constitution = [self randomCharacteristicValue];
        character.constitutionBonus = [self constitutionBonusForCharacter:character];

        character.intelligence = [self randomCharacteristicValue];
        character.intelligenceBonus = [self intelligenceBonusForCharacter:character];

        character.wisdom = [self randomCharacteristicValue];
        character.wisdomBonus = [self wisdomBonusForCharacter:character];

        character.charisma = [self randomCharacteristicValue];
        character.charismaBonus = [self charismaBonusForCharacter:character];

        [resultArr addObject:character];
    }

    return resultArr;
}

- (NSInteger)randomCharacteristicValue
{
    NSInteger resultValue = 0;
    for (int i = 0; i < kNumberOfRollings; i++)
    {
        resultValue += (arc4random_uniform(kNumberOfDices) + 1);
    }

    return resultValue;
}

- (NSInteger)strengthBonusForCharacter:(CharacterEntity *)character
{
    NSInteger resultBonus = [self bonusForCharacteristicValue:character.strength];

    return resultBonus;
}

- (NSInteger)dexterityBonusForCharacter:(CharacterEntity *)character
{
    NSInteger resultBonus = [self bonusForCharacteristicValue:character.dexterity];

    return resultBonus;
}

- (NSInteger)constitutionBonusForCharacter:(CharacterEntity *)character
{
    NSInteger resultBonus = [self bonusForCharacteristicValue:character.constitution];

    return resultBonus;
}

- (NSInteger)intelligenceBonusForCharacter:(CharacterEntity *)character
{
    NSInteger resultBonus = [self bonusForCharacteristicValue:character.intelligence];

    return resultBonus;
}

- (NSInteger)wisdomBonusForCharacter:(CharacterEntity *)character
{
    NSInteger resultBonus = [self bonusForCharacteristicValue:character.wisdom];

    return resultBonus;
}

- (NSInteger)charismaBonusForCharacter:(CharacterEntity *)character
{
    NSInteger resultBonus = [self bonusForCharacteristicValue:character.charisma];

    return resultBonus;
}

- (NSInteger)bonusForCharacteristicValue:(NSInteger)characteristicValue
{
    NSInteger resultBonus = (characteristicValue - kNumberOfRollings) / 2 - 3;
    return resultBonus;
}

@end
