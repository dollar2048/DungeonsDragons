//
//  CharacterTableViewCell.h
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacterEntity.h"
#import <UIKit/UIKit.h>

@interface CharacterTableViewCell : UITableViewCell

- (void)showCharacter:(CharacterEntity *)character;

@end
