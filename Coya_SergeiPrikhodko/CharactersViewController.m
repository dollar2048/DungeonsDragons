//
//  CharactersViewController.m
//  Coya_SergeiPrikhodko
//
//  Created by Sergei Prikhodko on 10/03/17.
//  Copyright © 2017 Sergei Prikhodko. All rights reserved.
//

#import "CharacterEntity.h"
#import "CharacterTableViewCell.h"
#import "CharactersModel.h"
#import "CharactersViewController.h"

@interface CharactersViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CharactersModel *model;

@end

@implementation CharactersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.model = [CharactersModel new];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.characters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CharacterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CharacterTableViewCell class])
                                                                   forIndexPath:indexPath];

    [cell showCharacter:self.model.characters[indexPath.row]];

    return cell;
}

@end
