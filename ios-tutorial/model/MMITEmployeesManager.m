#import <Reachability/Reachability.h>
#import "MMITEmployeesManager.h"
#import "Employees.h"
#import "MMITEmployee.h"
#import "Reachability.h"


@implementation MMITEmployeesManager

- (instancetype)initWithContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        self.context = context;
        self.reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        self.reachability.reachableBlock = ^(Reachability*reach) {
            [self fetchRemoteData];
        };
        [self.reachability startNotifier];
    }
    return self;
}

- (void) fetchRemoteData {
    NSURL *location = [NSURL URLWithString:@"http://127.0.0.1:8080/contacts.json"];
    [[[Employees alloc] init] getFeedsFrom:location withCompletionHandler:^(EmployeesResponse *er) {
        for (NSDictionary * employee in er.feeds) {
            [self saveEmployee:employee];
        }
    }];
}

- (void)saveEmployee:(NSDictionary *)item {
    MMITEmployee *employee = [self employeeWithName:[item objectForKey:@"name"]];
    if (!employee) return;

    NSString *imageUrl = [item objectForKey:@"imageUrl"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL* aURL = [NSURL URLWithString:imageUrl];
        NSData* imageData = [[NSData alloc] initWithContentsOfURL:aURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            //TODO (2)
        });
    });

    if ([item objectForKey:@"firstname"] && [item objectForKey:@"lastname"]) {
        [[[Employees alloc] init] getImageForEmployee:item withCompletionHandler:^ (UIImage *image) {
            //TODO (2)
        }];
    }
}

- (MMITEmployee *)employeeWithName:(NSString *)name {
    //TODO (2)
    return nil;
}

- (void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.context;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end