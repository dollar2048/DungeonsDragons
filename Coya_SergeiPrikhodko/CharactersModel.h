//
//  CharactersModel.h
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacterEntity.h"
#import <Foundation/Foundation.h>

@interface CharactersModel : NSObject

- (void)refreshData;

@property (strong, nonatomic, readonly) NSArray<CharacterEntity *> *characters;

@end
