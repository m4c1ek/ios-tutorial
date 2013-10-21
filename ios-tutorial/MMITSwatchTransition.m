//
//  MMITSwatchTransition.m
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/21/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import "MMITSwatchTransition.h"

@implementation MMITSwatchTransition
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGAffineTransform transformation = CGAffineTransformMakeRotation( - M_PI_2);
    toVC.view.layer.anchorPoint = CGPointZero;
    toVC.view.frame = [transitionContext initialFrameForViewController:fromVC];
    toVC.view.transform = transformation;
    
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.25 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL completed) {
        [transitionContext completeTransition:completed];
    }];
}

@end
