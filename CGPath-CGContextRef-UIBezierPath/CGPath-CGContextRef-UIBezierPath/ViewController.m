//
//  ViewController.m
//  CGPath-CGContextRef-UIBezierPath
//
//  Created by cnliveJunBo on 17/4/17.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - CGPath  1
/*
    // 开始图像绘画
    UIGraphicsBeginImageContext(self.view.bounds.size);
    // 获取当前 CGContextRef 上下文
    CGContextRef gc = UIGraphicsGetCurrentContext();
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 50);
    // 创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    // 左
    CGPathAddEllipseInRect(path, &transform, CGRectMake(0, 0, 20, 20));
    // 右
    CGPathAddEllipseInRect(path, &transform, CGRectMake(80, 0, 20, 20));
    // 笑
    CGPathMoveToPoint(path, &transform, 100, 50);
    CGPathAddArc(path, &transform, 50, 50, 50, 0, M_PI, NO);
    // 将CGMutablrPathRef添加到当前的Context内
    CGContextAddPath(gc, path);
    // 设置绘图属性
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(gc, 2);
    // 执行绘画(渲染)
    CGContextStrokePath(gc);
    // 释放
    CGPathRelease(path);
    // 从Context中获取图像,并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    // 结束
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imageView]; 
                                        */
    
#pragma mark - CGContextRef  2
    
/*
    // 完全使用CGContextRef的话，Transform的应用需使用CGContextTranslateCTM函数。
    // 开始图像绘画
    UIGraphicsBeginImageContext(self.view.bounds.size);
    // 获取上下文
    CGContextRef gc = UIGraphicsGetCurrentContext();
    // 使用 CGContextTranslateCTM 函数来转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGContextTranslateCTM(gc, 50, 50);
    // 左
    CGContextAddEllipseInRect(gc, CGRectMake(0, 0, 20, 20));
    // 右
    CGContextAddEllipseInRect(gc, CGRectMake(80, 0, 30, 30));
    // 笑
    CGContextMoveToPoint(gc, 100, 50);
    CGContextAddArc(gc, 50, 50, 50, 0, M_PI, NO);
    // 设置绘图属性
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(gc, 2);
    // 渲染
    CGContextStrokePath(gc);
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
                                        */
    
#pragma mark - UIBezierPath 3
    // UIBezierPath很有意思，它包装了Quartz的相关API，自己存在于UIKit中，因此不是基于C的API，而是基于Objective-C对象的。那么一个非常重要的点是由于离开了Quartz绘图，所以不需要考虑Y轴翻转的问题，在画弧的时候，clockwise参数是和现实一样的，如果需要顺时针就传YES，而不是像Quartz环境下传NO的。UIKit和CG坐标系y轴相反，所以图片绘制将会上下颠倒
    //开始图像绘图
    UIGraphicsBeginImageContext(self.view.bounds.size);
    //创建UIBezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    //左眼
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 20, 20)]];
    //右眼
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 0, 20, 30)]];
    //笑
    [path moveToPoint:CGPointMake(100, 50)];
    //注意这里clockwise参数是YES而不是NO，因为这里不知Quartz，不需要考虑Y轴翻转的问题
    [path addArcWithCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    //使用applyTransform函数来转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    [path applyTransform:CGAffineTransformMakeTranslation(50, 50)];
    //设置绘画属性
    [[UIColor blueColor] setStroke];
    [path setLineWidth:2];
    //执行绘画
    [path stroke];
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
    
#pragma mark - 判断是否在某一区域内
    //    CGMutablePathRef pathRef = CGPathCreateMutable();
    //    CGPathMoveToPoint(pathRef, NULL, 4, 4);
    //    CGPathAddLineToPoint(pathRef, NULL, 4, 14);
    //    CGPathAddLineToPoint(pathRef, NULL, 14, 14);
    //    CGPathAddLineToPoint(pathRef, NULL, 14, 4);
    //    CGPathAddLineToPoint(pathRef, NULL, 4, 4);
    //    CGPathCloseSubpath(pathRef);
    //    CGPoint point=CGPointMake(5, 5);
    //    CGPoint outPoint=CGPointMake(1, 1);
    
    //    if (CGPathContainsPoint(pathRef, NULL, point, NO))
    //    {
    //        NSLog(@"point in path!");
    //    }
    //
    //    if (!CGPathContainsPoint(pathRef, NULL, outPoint, NO))
    //    {
    //        NSLog(@"outPoint out path!");
    //    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
