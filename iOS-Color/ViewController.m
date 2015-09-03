//
//  ViewController.m
//  iOS-Color
//
//  Created by Emiliano Barbosa on 9/2/15.
//  Copyright (c) 2015 Bocamuchas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIView *box;
@property (nonatomic, strong) IBOutlet UIView *boxLight;
@property (nonatomic, strong) IBOutlet UIView *boxDark;
@property (weak, nonatomic) IBOutlet UIView *boxOverlay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_boxLight setBackgroundColor:[self lighterColorForColor:_box.backgroundColor]];
    
    [_boxDark setBackgroundColor:[self darkerColorForColor:_box.backgroundColor]];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = _boxOverlay.layer.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.05f].CGColor,
                            (id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.05f].CGColor,
                            nil];
    [_boxOverlay.layer addSublayer:gradientLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark http://stackoverflow.com/questions/11598043/get-slightly-lighter-and-darker-color-from-uicolor
- (UIColor *)lighterColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.2, 2.0)
                               green:MIN(g + 0.2, 2.0)
                                blue:MIN(b + 0.2, 2.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.2, -1.0)
                               green:MAX(g - 0.2, -1.0)
                                blue:MAX(b - 0.2, -1.0)
                               alpha:a];
    return nil;
}

@end
