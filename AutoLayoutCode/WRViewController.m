//
//  WRViewController.m
//  AutoLayoutCode
//
//  Created by zjsruxxxy3 on 15/4/18.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "WRViewController.h"

@interface WRViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (weak, nonatomic) IBOutlet UIView *animateView;
@end

@implementation WRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self coupleViewAddConstraintsShow];
//    [self singleViewAddConstraintsShow];
//    [self singeleViewUsingVFLShow];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self animateViewStartAnimating];
    
}

-(void)animateViewStartAnimating
{
    NSLog(@"touch-------");
    
    self.leftConstraint.constant = 220;
    
    self.bottomConstraint.constant = 528;
    
    self.heightConstraint.constant = 20;
    
    [UIView animateWithDuration:4.0f animations:^{
        
        [self.view layoutIfNeeded];
        [self.animateView layoutIfNeeded];
        //        [self.view setNeedsUpdateConstraints];
        //        [self.view setNeedsLayout];
        
        
    }];
}

-(void)coupleViewUsingVFLShow
{
    
}

-(void)singeleViewUsingVFLShow
{
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    // use autolayout must set NO
    blueView.translatesAutoresizingMaskIntoConstraints =NO;
    [self.view addSubview:blueView];
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView);

    NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[blueView]-margin-|" options:0 metrics:@{@"margin":@50} views:@{@"blueView": blueView}];
    NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[blueView(50)]" options:0 metrics:nil views:views];
    [self.view addConstraints:constraintsH];
    [self.view addConstraints:constraintsV];

}

-(void)singleViewAddConstraintsShow
{
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    // use autolayout must set NO
    blueView.translatesAutoresizingMaskIntoConstraints =NO;
    [self.view addSubview:blueView];
    
    // add constraint  blueView = self.view * multi （+or-） constrant
    NSLayoutConstraint *WidthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
    NSLayoutConstraint *HeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
    [blueView addConstraints:@[WidthConstraint,HeightConstraint,]];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    // 位置约束必须给对应的父控件
    [self.view addConstraints:@[xConstraint,yConstraint]];
    
}

-(void)coupleViewAddConstraintsShow
{
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    // use autolayout must set NO
    blueView.translatesAutoresizingMaskIntoConstraints =NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    /**
     *  add Constraints
     */
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40];
    [blueView addConstraint:blueHeight];
    
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30.0];
    NSLayoutConstraint *blueRight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30.0];
    NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    [self.view addConstraints:@[blueTop,blueLeft,blueRight]];
    
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *redRight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    NSLayoutConstraint *redLeft = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    // 两个子控件之间的约束找最近联系的父控件添加
    [self.view addConstraints:@[redTop,redRight,redLeft,redHeight]];
    
}




@end
