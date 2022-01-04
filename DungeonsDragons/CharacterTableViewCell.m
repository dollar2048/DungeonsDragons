//
//  CharacterTableViewCell.m
//  DungeonsDragons
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
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CharacterTableViewCell

- (void)showCharacter:(CharacterEntity *)character
{
    self.character = character;

    self.name.text = character.name;
    self.avatar.image = [self avatarForClassType:character.classType];
    self.race.text = [self raceStringForRaceType:character.raceType];

    [self.tableView reloadData];
}

#pragma mark - Private

- (UIImage *)avatarForClassType:(ClassType)classType
{
    switch (classType)
    {
        case ClassTypeRanger:
            return [UIImage imageNamed:@"ranger"];
        case ClassTypeWizard:
            return [UIImage imageNamed:@"wizard"];
        case ClassTypeWarrior:
            return [UIImage imageNamed:@"warrior"];
        case ClassTypeCount:
            return nil;
    }
}

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
            [cell showName:@"Str" value:self.character.strength bonus:self.character.strengthBonus];
            break;
        case 1:
            [cell showName:@"Dxf" value:self.character.dexterity bonus:self.character.dexterityBonus];
            break;
        case 2:
            [cell showName:@"Con" value:self.character.constitution bonus:self.character.constitutionBonus];
            break;
        case 3:
            [cell showName:@"Int" value:self.character.intelligence bonus:self.character.intelligenceBonus];
            break;
        case 4:
            [cell showName:@"Wis" value:self.character.wisdom bonus:self.character.wisdomBonus];
            break;
        case 5:
            [cell showName:@"Cha" value:self.character.charisma bonus:self.character.charismaBonus];
            break;
        default:
            [cell showName:@"0" value:0 bonus:0];
            break;
    }
    return cell;
}

@end
