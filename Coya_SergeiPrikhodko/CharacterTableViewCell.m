//
//  CharacterTableViewCell.m
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacterTableViewCell.h"
#import "CharacteristicTableViewCell.h"

@interface CharacterTableViewCell () <UITableViewDataSource>
@property (strong, nonatomic) CharacterEntity *character;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *race;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end

@implementation CharacterTableViewCell

- (void)showCharacter:(CharacterEntity *)character
{
    self.character = character;

    self.name.text = character.name;
    self.race.text = [self raceStringForRaceType:character.raceType];
}

#pragma mark - Private

- (NSString *)raceStringForRaceType:(RaceType)raceType
{
    switch (raceType)
    {
        case RaceTypeElf:
            return @"Elf";
        case RaceTypeDwarf:
            return @"Dwarf";
        case RaceTypeHuman:
            return @"Human";
        case RaceTypeCount:
            return @"";
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CharacteristicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CharacteristicTableViewCell class])
                                                                        forIndexPath:indexPath];

    switch (indexPath.row)
    {
        case 0:
            [cell showName:@"Str" value:self.character.strength bonus:0];
            break;
        case 1:
            [cell showName:@"Dxf" value:self.character.dexterity bonus:0];
            break;
        case 2:
            [cell showName:@"Con" value:self.character.constitution bonus:0];
            break;
        case 3:
            [cell showName:@"Int" value:self.character.intelligence bonus:0];
            break;
        case 4:
            [cell showName:@"Wis" value:self.character.wisdom bonus:0];
            break;
        case 5:
            [cell showName:@"Cha" value:self.character.charisma bonus:0];
            break;
        default:
            [cell showName:@"0" value:0 bonus:0];
            break;
    }
    return cell;
}

@end