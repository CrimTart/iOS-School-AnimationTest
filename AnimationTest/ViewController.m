//
//  ViewController.m
//  AnimationTest
//
//  Created by iOS-School-1 on 03.06.17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame: CGRectMake(20, 20, 40, 50)];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self
                 action:@selector(button1Press)
       forControlEvents:UIControlEventTouchUpInside];
    UIButton *button2 = [[UIButton alloc] initWithFrame: CGRectMake(120, 20, 40, 50)];
    button2.backgroundColor = [UIColor greenColor];
    [button2 addTarget:self
                action:@selector(button2Press)
      forControlEvents:UIControlEventTouchUpInside];
    UIButton *button3 = [[UIButton alloc] initWithFrame: CGRectMake(220, 20, 40, 50)];
    button3.backgroundColor = [UIColor grayColor];
    [button3 addTarget:self
                action:@selector(button3Press)
      forControlEvents:UIControlEventTouchUpInside];
    UIButton *button4 = [[UIButton alloc] initWithFrame: CGRectMake(320, 20, 40, 50)];
    button4.backgroundColor = [UIColor blackColor];
    [button4 addTarget:self
                action:@selector(button4Press)
      forControlEvents:UIControlEventTouchUpInside];
    UIButton *button5 = [[UIButton alloc] initWithFrame: CGRectMake(20, 80, 40, 50)];
    button5.backgroundColor = [UIColor yellowColor];
    [button5 addTarget:self
                action:@selector(button5Press)
      forControlEvents:UIControlEventTouchUpInside];
    UIButton *button6 = [[UIButton alloc] initWithFrame: CGRectMake(120, 80, 40, 50)];
    button6.backgroundColor = [UIColor purpleColor];
    [button6 addTarget:self
                action:@selector(button6Press)
      forControlEvents:UIControlEventTouchUpInside];
    self.squareView = [[UIView alloc] initWithFrame:CGRectMake(100, 170, 100, 100)];
    self.squareView.backgroundColor = [UIColor redColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button5];
    [self.view addSubview:button6];
    [self.view addSubview:self.squareView];

}

- (void)button1Press{
    [UIView animateWithDuration:2.0 animations:^{
        self.squareView.alpha = 0.0;
    }];
}

- (void)button2Press{
    [UIView animateWithDuration:2.0 animations:^{
        self.squareView.alpha = 1.0;
    }];
}

- (void)button3Press{
    CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, rand());
    [UIView animateWithDuration:2.0 animations:^{
        self.squareView.transform = transform;
    }];
}

- (void)button4Press{
    //CGRect f = self.squareView.frame; - bad, effs up the bounds
    //f.origin.x = rand()%300;
    //f.origin.y = rand()%300;
    [UIView animateWithDuration:2.0 animations:^{
        self.squareView.center = CGPointMake(rand()%300, rand()%300);
    }];
}

- (void)button5Press{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0, @10, @-10, @10, @0];
    animation.keyTimes = @[@0, @(1/6.0), @(3/6.0), @(5/6.0), @1];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [self.squareView.layer addAnimation:animation forKey:@"shake"];
}

- (void)button6Press{
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [self.squareView.layer addAnimation:orbit forKey:@"orbit"];
}

@end
