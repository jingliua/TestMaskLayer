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
    
   // [self.view setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:1]];
    
    UIButton * _maskButton = [[UIButton alloc] init];
    [_maskButton setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-30)];
    [_maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
//    [_maskButton setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.3]];//mask是个遮罩，其颜色信息被忽略，只有透明度信息有用。
    [self.view.layer setMask:_maskButton.layer];//设置self.view.layer的遮罩层
    
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(150, 500, 200, 100)];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(150, 260, 200, 100)];//矩形
    [path1 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2+100, 200+80) radius:100 startAngle:M_PI endAngle:2*M_PI clockwise:YES]];//圆弧,NO为逆时针画。默认顺时针，angel为0的位置在最右边，如果设置成NO之后，不管fillRule为什么相交处都是透明的！！
   
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.lineWidth = 5;
    shapeLayer1.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer1.fillColor = [UIColor purpleColor].CGColor;
    [shapeLayer1 setFillRule:kCAFillRuleEvenOdd];
//    shapeLayer1.fillColor = [UIColor clearColor].CGColor;
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
    
    
    //下面是用来测试kCAFillRuleEvenOdd的
//    UIView* aView = [[UIView alloc] initWithFrame:CGRectMake(10,10, 100, 100)];
//    //    aView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:aView];
//    aView.layer.borderWidth =5.0;
//    aView.layer.borderColor = [UIColor blackColor].CGColor;
//    
//    
//    CAShapeLayer* cropLayer = [[CAShapeLayer alloc] init];
//    [aView.layer addSublayer:cropLayer];
//    
//    CGMutablePathRef path =CGPathCreateMutable();
//    CGRect cropRect = CGRectMake(20, 20, 50, 90);
//    CGPathAddRect(path, nil, CGRectMake(10,10, 80, 80));
//    CGPathAddRect(path, nil, cropRect);
//    [cropLayer setFillColor:[[UIColor purpleColor] CGColor]];
//    [cropLayer setFillRule:kCAFillRuleNonZero];//kCAFillRuleEvenOdd 相交的那个框不fill，kCAFillRuleNonZero整个path最外层fill
//    [cropLayer setPath:path];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
