//
//  CharacterEntity.m
//  DungeonsDragons
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacterEntity.h"

@implementation CharacterEntity

- (NSInteger)power
{
    return self.strengthBonus
           + self.dexterityBonus
           + self.constitutionBonus
           + self.intelligenceBonus
           + self.wisdomBonus
           + self.charismaBonus;
}
@end
