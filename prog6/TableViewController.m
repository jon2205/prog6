//
//  TableViewController.m
//  prog6
//
//  Created by Admin on 10/15/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"
#import "AFNetworking.h"


@interface TableViewController ()

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.dribbble.com/shots/popular?per_page=50" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {

         NSLog(@"JSON: %@", responseObject);
         NSLog(@"111111111111111111111111");
         NSLog(@"JSON: %@", responseObject[@"shots"][0][@"title"]);
         //for (int i=0;i<17;i++) {
         //    self.Title[i]=[NSString stringWithFormat:@"%@", responseObject[@"shots"][i][@"title"]];
         //}
         NSLog(@"JSON: %@", responseObject[@"shots"][1][@"title"]);
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    
    self.Title = @[@"111",
                   @"222",
                   @"333",
                   @"444",
                   @"555",
                   @"666",
                   @"777",
                   @"888",
                   @"999",
                   @"101",
                   @"102",
                   @"103",
                   @"104",
                   @"105",
                   @"106",
                   @"107",
                   @"108"];
    
    self.Images = @[@"Default@2x.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default@2x.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png",
                    @"Default.png"];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.Title.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableCell";
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = [indexPath row];
    
    cell.TitleLabel.text = self.Title[row];
    cell.ThumpImage.image = [UIImage imageNamed:self.Images[row]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
