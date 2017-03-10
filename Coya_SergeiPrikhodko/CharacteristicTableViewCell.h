//
//  CharacteristicTableViewCell.h
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacteristicTableViewCell : UITableViewCell

- (void)showName:(NSString *)name value:(NSInteger)value bonus:(NSInteger)bonus;

@end
