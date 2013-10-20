//
//  MMITEmployeesViewController.m
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/16/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import "MMITEmployeesViewController.h"
#import "MMITTableViewCellEmployee.h"
#import "MMITAppDelegate.h"
#import "MMITEmployee.h"

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

- (NSManagedObjectContext *) managedObjectContext {
    MMITAppDelegate* delegate = (MMITAppDelegate *) [[UIApplication sharedApplication] delegate];
    return delegate.managedObjectContext;
}

- (NSFetchedResultsController *)fetchedResultsController  {

    //TODO (2) construct the fetch results controller
    return nil;

}

- (void)viewDidLoad
{
    //TODO (2) start the fetch results controller
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
    // TODO (2) number of sections from fetch results controller
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // TODO (2) number of rows in section from fetch results controller
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)path {
    //TODO(2) configure the cell with data from fetch results controller
}


#pragma mark - Fetch results controller boilerplate code

//TODO(2) https://developer.apple.com/library/ios/documentation/CoreData/Reference/NSFetchedResultsControllerDelegate_Protocol/Reference/Reference.html


@end
