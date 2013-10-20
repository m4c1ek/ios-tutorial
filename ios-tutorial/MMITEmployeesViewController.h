//
//  MMITEmployeesViewController.h
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/16/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//



@interface MMITEmployeesViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property(nonatomic, strong) NSArray *feeds;
@property(nonatomic, strong) NSMutableDictionary *images;
@property(nonatomic, strong) UIImage *emptyImage;
@property(nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end
