//
//  ViewController.m
//  FDCalenderView
//
//  Created by 徐忠林 on 07/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "ViewController.h"
#import "FDCalenderView.h"
#import "FDTableViewCell.h"
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"签到记录";
    
    
    self.view.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:237.0/255.0 blue:240.0/255.0 alpha:1];
    
    [self setupUI];
    
    //很简单，你只需要让这个Controller本身支持摇动

    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    
    
    //同时让他成为第一相应者：

    [self becomeFirstResponder];
    
    
}

- (void) setupUI {
    FDCalenderView *calender = [[FDCalenderView alloc]initWithFrame:CGRectMake(10, 65, self.view.bounds.size.width - 20, ((self.view.bounds.size.width - 20) / 7) * 5 + 50)];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:calender.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = calender.bounds;
    maskLayer.path = maskPath.CGPath;
    calender.layer.mask = maskLayer;
    //    其中，byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
    //    指定了需要成为圆角的角。该参数是UIRectCorner类型的，可选的值有：
    //    UIRectCornerTopLeft
    //    UIRectCornerTopRight
    //    UIRectCornerBottomLeft
    //    UIRectCornerBottomRight
    //    UIRectCornerAllCorners
    
    
    
    [self.view addSubview:calender];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(MainScreenWidth/3,CGRectGetMaxY(calender.frame) + 20, 110, 30)];
    label1.text = @"打败89%的师傅";
    label1.textColor = [UIColor lightGrayColor];
    label1.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label1];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame) + 10, CGRectGetMaxY(calender.frame) + 15, 100, 40)];
    btn.backgroundColor = [UIColor colorWithRed:151 green:117 blue:250];
    [btn setTitle:@"查看详情>" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    [self.view addSubview:btn];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(btn.frame) + 10, MainScreenWidth - 20, 20)];
    [self.view addSubview:headerView];
    
    UITableView *tableViews = [[UITableView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(headerView.frame), MainScreenWidth - 20, MainScreenHeight - CGRectGetMaxY(btn.frame)-30)];
    tableViews.backgroundColor = [UIColor clearColor];
    tableViews.delegate = self;
    tableViews.dataSource = self;
    [self.view addSubview:tableViews];
    
    
    
    UILabel *signRecordLabel = [[UILabel alloc] initWithFrame:headerView.bounds];
    signRecordLabel.text = @"    明细";
    signRecordLabel.textColor =[UIColor colorWithRed:151 green:117 blue:250];
    [headerView addSubview:signRecordLabel];
    
}


#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FDTableViewCell"];
    
    if (cell == nil) {
        cell = [FDTableViewCell testCell];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


#pragma mark - 摇一摇功能


- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //检测到摇动
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"手机正在摇一摇"preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];

}



- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动取消
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"手机正在摇动取消"preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动结束
    
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        //something happens
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"手机摇动取消"preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}


@end
