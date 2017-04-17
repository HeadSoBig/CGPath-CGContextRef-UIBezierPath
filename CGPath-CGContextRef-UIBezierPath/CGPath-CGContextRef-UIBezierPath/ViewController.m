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
