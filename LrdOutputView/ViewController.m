//
//  ViewController.m
//  LrdOutputView
//
//  Created by 键盘上的舞者 on 4/14/16.
//  Copyright © 2016 键盘上的舞者. All rights reserved.
//

#import "ViewController.h"
#import "LrdOutputView.h"

@interface ViewController () <LrdOutputViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) LrdOutputView *outputView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //几个model
    LrdCellModel *one = [[LrdCellModel alloc] initWithTitle:@"附近学校" imageName:@"item_school"];
    LrdCellModel *two = [[LrdCellModel alloc] initWithTitle:@"联赛流程" imageName:@"item_battle"];
    LrdCellModel *three = [[LrdCellModel alloc] initWithTitle:@"其他联赛" imageName:@"item_list"];
    LrdCellModel *four = [[LrdCellModel alloc] initWithTitle:@"校内群聊" imageName:@"item_chat"];
    LrdCellModel *five = [[LrdCellModel alloc] initWithTitle:@"邀请好友" imageName:@"item_share"];
    self.dataArr = @[one, two, three, four, five];
    
}

- (IBAction)btnClicked:(UIButton *)btn{
    if (btn.tag == 11) {
        CGFloat x = btn.center.x;
        CGFloat y = btn.frame.origin.y + btn.bounds.size.height + 10;
        
        _outputView = [[LrdOutputView alloc] initWithDataArray:self.dataArr origin:CGPointMake(x, y) width:125 height:44 direction:kLrdOutputViewDirectionLeft];
    }else {
        CGFloat x = btn.center.x;
        CGFloat y = btn.frame.origin.y + btn.bounds.size.height + 10;
        _outputView = [[LrdOutputView alloc] initWithDataArray:self.dataArr origin:CGPointMake(x, y) width:125 height:44 direction:kLrdOutputViewDirectionRight];
    }
    _outputView.delegate = self;
    _outputView.dismissOperation = ^(){
        //设置成nil，以防内存泄露
        _outputView = nil;
    };
    [_outputView pop];
}

- (void)didSelectedAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"主人，别戳人家" message:[NSString stringWithFormat:@"你点击了%ld行", indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    //创建一个action
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
