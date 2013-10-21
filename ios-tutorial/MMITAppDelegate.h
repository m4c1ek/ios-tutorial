//
//  MMITAppDelegate.h
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/14/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMITEmployeesManager;

@interface MMITAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic, strong) MMITEmployeesManager *employeeManager;

- (NSURL *)applicationDocumentsDirectory;

@end
