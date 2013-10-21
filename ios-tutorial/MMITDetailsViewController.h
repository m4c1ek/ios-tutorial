//
//  MMITDetailsViewController.h
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/21/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMITEmployee;

@interface MMITDetailsViewController : UIViewController

@property(nonatomic, strong) MMITEmployee *employee;
@property(nonatomic, strong) IBOutlet UIImageView * leftImageView;
@property(nonatomic, strong) IBOutlet UIImageView * rightImageView;
@end
