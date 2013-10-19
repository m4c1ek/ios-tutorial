//
//  MMITEmployeesViewController.m
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/16/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import "MMITEmployeesViewController.h"
#import "Employees.h"
#import "MMITTableViewCellEmployee.h"

@interface MMITEmployeesViewController ()

@end

@implementation MMITEmployeesViewController

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
    NSURL *location = [NSURL URLWithString:@"http://192.168.0.11:8080/contacts.json"];
    [[[Employees alloc] init] getFeedsFrom:location withCompletionHandler:^(EmployeesResponse *er) {
        self.feeds = er.feeds;
        self.emptyImage = [UIImage imageNamed:@"empty.png"];
        self.images = [NSMutableDictionary dictionaryWithCapacity:[er.feeds count]];
        [self.tableView reloadData];
    }];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.feeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MMITTableViewCellEmployee *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary * item = [self.feeds objectAtIndex:indexPath.row];
    cell.customLabel.text = [item objectForKey:@"name"];

    cell.customImage.image = nil;
    NSString *imageUrl = [item objectForKey:@"imageUrl"];
    UIImage * cachedImage = [self.images objectForKey:imageUrl];
    if (imageUrl && !cachedImage) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL* aURL = [NSURL URLWithString:imageUrl];
            NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                [self.images setObject:image forKey:imageUrl];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
                });
            }
        });
    }
    else if (cachedImage) {
        cell.customImage.image = cachedImage;
    }

    cell.linkedinImageView.image = nil;
    BOOL hasFirstAndLast = ([item objectForKey:@"firstname"] && [item objectForKey:@"lastname"]);
    NSString *firstnamelastname = [NSString stringWithFormat:@"%@%@",[item objectForKey:@"firstname"], [item objectForKey:@"lastname"]];
    UIImage * cachedLinkedinImage = [self.images objectForKey:firstnamelastname];
    if (hasFirstAndLast && !cachedLinkedinImage) {
        [[[Employees alloc] init] getImageForEmployee:item withCompletionHandler:^ (UIImage *image) {
            if (image) {
                [self.images setObject:image forKey:firstnamelastname];
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
        }];
    } else if (cachedLinkedinImage) {
      cell.linkedinImageView.image = cachedLinkedinImage;
    }

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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
