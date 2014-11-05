//
//  TableViewController.m
//  prog6
//
//  Created by Admin on 10/15/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "ShotCell.h"
#import "NSShot.h"
#import "ShotNetworkManager.h"
#import "UIImageView+AFNetworking.h"


@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *shotArray;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shotArray = [[NSMutableArray alloc] init];
    [[ShotNetworkManager sharedManager] shotRequest:^(NSArray *shots) {
        for (NSDictionary *shotInfo in shots) {
            NSShot *shot=[[NSShot alloc] init];
            shot.title = shotInfo[@"title"];
            shot.image = shotInfo[@"image_teaser_url"];
            [self.shotArray addObject: shot];
        }
        [self.tableView reloadData];
    } failure:^(NSString *errorMessage) {
        NSLog(@"Error %@", errorMessage);
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shotArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableCell";
    ShotCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSShot *shot=[[NSShot alloc] init];
    shot = self.shotArray[indexPath.row];
    cell.TitleLabel.text = shot.title;
    [cell.ThumpImage setImageWithURL:[NSURL URLWithString: shot.image]];
    
    return cell;
}

@end
