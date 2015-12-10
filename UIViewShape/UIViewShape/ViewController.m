//
//  ViewController.m
//  UIViewShape
//
//  Created by mac on 15/12/10.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

#import "ViewController.h"

static BOOL isOpen1;
@interface ViewController ()


@property (nonatomic,strong) UIButton * btn1;

@property (nonatomic,strong) UIButton * btn2;

@property (nonatomic,strong) UIButton * btn3;

@property (nonatomic,strong) CAShapeLayer * shapeLayer;

@property (nonatomic,strong) UIView * greenview;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    isOpen1 = NO;
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.btn1.frame = CGRectMake(0, 20, self.view.frame.size.width, 80);
    
    self.btn1.backgroundColor = [UIColor redColor];
    
    [self.btn1 addTarget:self action:@selector(shapeChange:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.btn1];
    
    
    /*形状*/
    
    self.shapeLayer = [CAShapeLayer layer];
    
    self.shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    
    self.shapeLayer.fillColor = [UIColor greenColor].CGColor;
    
    self.shapeLayer.lineWidth = 2;
    /*路径*/
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, self.view.frame.size.width / 4 + 50 ,80);
    
    CGPathAddLineToPoint(path, NULL, self.view.frame.size.width / 2, 40);
    
    CGPathAddLineToPoint(path, NULL, self.view.frame.size.width / 4 * 3 - 50, 80);
    
    
    
    
    
    self.shapeLayer.path = path;
    
    self.shapeLayer.frame = self.btn1.bounds;
    
    
    /*视图*/
    
    self.greenview = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100)];
    
    self.greenview.backgroundColor = [UIColor greenColor];

    [self.view addSubview:self.greenview];
    
    
    self.greenview.hidden = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)shapeChange:(UIButton *) sender {
    
    
    if (isOpen1 == NO) {

        
        self.greenview.hidden = NO;
        [self.btn1.layer addSublayer:self.shapeLayer];
        
        isOpen1 = YES;
    }
    else {
        
        self.greenview.hidden = YES;
        [self.shapeLayer removeFromSuperlayer];
        
        isOpen1 = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
