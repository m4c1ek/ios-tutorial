//
//  MMITDetailsViewController.m
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/21/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import "MMITDetailsViewController.h"
#import "MMITEmployee.h"

@interface MMITDetailsViewController ()

@end

@implementation MMITDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Custom initialization
    }
    return self;
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    self.leftImageView.image = [UIImage imageWithData:_employee.image];
    self.rightImageView.image = [UIImage imageWithData:_employee.linkedInImage];
    self.view.tintColor = [UIColor whiteColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
