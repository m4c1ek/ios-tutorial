#import <Foundation/Foundation.h>

@class Reachability;

@interface MMITEmployeesManager : NSObject
@property(nonatomic, strong) NSManagedObjectContext *context;
@property(nonatomic, strong) Reachability *reachability;
- (instancetype)initWithContext:(NSManagedObjectContext *)context;
@end