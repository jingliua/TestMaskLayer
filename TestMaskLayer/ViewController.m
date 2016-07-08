//
//  ViewController.m
//  TestMaskLayer
//
//  Created by liujing on 7/7/16.
//  Copyright © 2016 liujing. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:1]];
//    
    UIButton * _maskButton = [[UIButton alloc] init];
    [_maskButton setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-30)];
    [_maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
//    [_maskButton setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.3]];//mask是个遮罩，其颜色信息被忽略，只有透明度信息有用。
    [self.view.layer setMask:_maskButton.layer];//设置self.view.layer的遮罩层
    
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(150, 200, 500, 100)];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(150, 200, 200, 100)];//矩形
    [path1 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2+100, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];//圆
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.lineWidth = 5;
    shapeLayer1.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer1.fillColor = [UIColor purpleColor].CGColor;
    shapeLayer1.path = path1.CGPath;
    
//    [self.view.layer setMask:shapeLayer1];
//    [_maskButton.layer addSublayer:shapeLayer1];
    [self.view.layer addSublayer:shapeLayer1];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 300, 200)];
    [path2 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2-50, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.lineWidth = 5;
    shapeLayer2.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer2.fillColor = [UIColor blueColor].CGColor;
    shapeLayer2.path = path2.CGPath;
//    [shapeLayer2 setLineJoin:@"round"];
//    shapeLayer2.strokeStart=0.0f;
//    shapeLayer2.strokeEnd=1.0f;
    [shapeLayer2 setLineDashPattern:@[@(50.0),@(2.0)]];
  
//    [self.view.layer setMask:shapeLayer];
     [_maskButton.layer addSublayer:shapeLayer2];
//   [self.view.layer addSublayer:shapeLayer];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
