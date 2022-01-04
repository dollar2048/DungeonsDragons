//
//  CharactersModel.h
//  DungeonsDragons
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacterEntity.h"
#import <Foundation/Foundation.h>

@interface CharactersModel : NSObject

/**
 * @brief Сlear characters. So refresh UI after it.
 */
- (void)refreshData;

/**
 * @brief Lazy initialized array of characters
 */
- (NSArray<CharacterEntity *> *)characters;

@end
