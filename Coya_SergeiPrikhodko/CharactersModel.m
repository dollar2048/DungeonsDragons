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

@property (strong, nonatomic) NSArray<CharacterEntity *> *characters;

@end

@implementation CharactersModel

- (void)refreshData
{
    self.characters = nil;
}

- (NSArray<CharacterEntity *> *)characters
{
    if (!_characters)
    {
        self.characters = [self generateCharacterListFor:kCharactersAmount];
        self.characters = [self.characters sortedArrayUsingComparator:^NSComparisonResult(CharacterEntity *character1, CharacterEntity *character2) {

          NSInteger power1 = character1.power;
          NSInteger power2 = character2.power;
          if (power1 > power2)
          {
              return NSOrderedAscending;
          }
          else if (power1 < power2)
          {
              return NSOrderedDescending;
          }
          else
          {
              return NSOrderedSame;
          }
        }];
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
        character.name = [self randomName];
        character.raceType = arc4random_uniform(RaceTypeCount);
        character.classType = arc4random_uniform(ClassTypeCount);

        character.strength = [self randomCharacteristicValue];
        character.dexterity = [self randomCharacteristicValue];
        character.constitution = [self randomCharacteristicValue];
        character.intelligence = [self randomCharacteristicValue];
        character.wisdom = [self randomCharacteristicValue];
        character.charisma = [self randomCharacteristicValue];

        [self addCharacteristicValueBonusesForCharacter:character];
        [self addRaceBonusesForCharacter:character];
        [self addClassBonusesForCharacter:character];

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

- (NSString *)randomName
{
    NSArray *names = @[
        @"Wynyra",
        @"Torxina",
        @"Helexisys",
        @"Keylee",
        @"Daethyra",
        @"Liaralei",
        @"Gilrieth",
        @"Holasys",
        @"Envaris",
        @"Shagella",
        @"Jordon",
        @"Carlo",
        @"Kyree",
        @"Derk",
        @"Snowdun",
        @"Howard",
        @"Muhammad",
        @"Park",
        @"Garlan",
    ];
    return names[arc4random_uniform((UInt32)names.count)];
}

- (void)addCharacteristicValueBonusesForCharacter:(CharacterEntity *)character
{
    character.strengthBonus += [self bonusForCharacteristicValue:character.strength];
    character.dexterityBonus += [self bonusForCharacteristicValue:character.dexterity];
    character.constitutionBonus += [self bonusForCharacteristicValue:character.constitution];
    character.intelligenceBonus += [self bonusForCharacteristicValue:character.intelligence];
    character.wisdomBonus += [self bonusForCharacteristicValue:character.wisdom];
    character.charismaBonus += [self bonusForCharacteristicValue:character.charisma];
}

- (void)addRaceBonusesForCharacter:(CharacterEntity *)character
{
    if (character.raceType == RaceTypeDwarf)
    {
        character.strengthBonus += 2;
        character.constitutionBonus += 2;
        character.dexterityBonus -= 2;
        character.charismaBonus -= 2;
    }
    else if (character.raceType == RaceTypeElf)
    {
        character.strengthBonus -= 2;
        character.dexterityBonus += 2;
    }
}

- (void)addClassBonusesForCharacter:(CharacterEntity *)character
{
    if (character.classType == ClassTypeWarrior)
    {
        if (character.raceType == RaceTypeDwarf)
        {
            character.strengthBonus += 3;
        }
        else if (character.raceType == RaceTypeHuman)
        {
            character.strengthBonus += 2;
        }
    }
    else if (character.classType == ClassTypeWizard)
    {
        if (character.raceType == RaceTypeHuman
            || character.raceType == RaceTypeElf)
        {
            character.intelligenceBonus += 1;
        }
    }
    else if (character.classType == ClassTypeRanger)
    {
        if (character.raceType == RaceTypeElf)
        {
            character.dexterityBonus += 1;
        }
    }
}

- (NSInteger)bonusForCharacteristicValue:(NSInteger)characteristicValue
{
    NSInteger resultBonus = (characteristicValue - kNumberOfRollings) / 2 - 3;
    return resultBonus;
}

@end
