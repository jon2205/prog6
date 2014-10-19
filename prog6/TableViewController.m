//
//  TableViewController.m
//  prog6
//
//  Created by Admin on 10/15/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "ShotCell.h"
#import "ShotNetworkManager.h"
#import "UIImageView+AFNetworking.h"


@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *shots;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray *imageViewArray;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shots = [NSMutableArray new];
    self.imageView = [UIImageView new];
    self.imageViewArray = [[NSMutableArray arrayWithObject:self.imageView] init];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [[ShotNetworkManager sharedManager] shotRequest:^(NSArray *shots) {
        for (NSDictionary *shotInfo in shots) {
            [self.shots addObject:shotInfo[@"title"]];
            [self.imageView setImageWithURL:[NSURL URLWithString:shotInfo[@"image_teaser_url"]]];
            [self.imageViewArray addObject:self.imageView];
        }
        [self.tableView reloadData];
    } failure:^(NSString *errorMessage) {
        NSLog(@"Error %@", errorMessage);
    }];
    
//    self.Title = @[@"111",
//                   @"222",
//                   @"333",
//                   @"444",
//                   @"555",
//                   @"666",
//                   @"777",
//                   @"888",
//                   @"999",
//                   @"101",
//                   @"102",
//                   @"103",
//                   @"104",
//                   @"105",
//                   @"106",
//                   @"107",
//                   @"108"];
//    
//    self.Images = @[@"Default@2x.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default@2x.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png",
//                    @"Default.png"];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.shots.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableCell";
    ShotCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.TitleLabel.text = self.shots[indexPath.row];
    cell.ThumpImage.image = self.imageViewArray[indexPath.row];
    
    return cell;
}

@end
