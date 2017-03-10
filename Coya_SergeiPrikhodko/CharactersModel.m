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
        character.dexterity = [self randomCharacteristicValue];
        character.constitution = [self randomCharacteristicValue];
        character.intelligence = [self randomCharacteristicValue];
        character.wisdom = [self randomCharacteristicValue];
        character.charisma = [self randomCharacteristicValue];

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

@end
