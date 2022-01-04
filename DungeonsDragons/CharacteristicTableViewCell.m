//
//  CharacteristicTableViewCell.m
//  DungeonsDragons
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacteristicTableViewCell.h"

@interface CharacteristicTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *value;
@property (weak, nonatomic) IBOutlet UILabel *bonus;
@end

@implementation CharacteristicTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.value.layer.borderColor = [UIColor grayColor].CGColor;
    self.value.layer.borderWidth = 1;
}

- (void)showName:(NSString *)name value:(NSInteger)value bonus:(NSInteger)bonus
{
    self.name.text = name;
    self.value.text = [NSString stringWithFormat:@"%ld", (long)value];
    self.bonus.text = [NSString stringWithFormat:@"%+ld", (long)bonus];
}

@end
