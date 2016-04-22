//
//  ViewController.m
//  MYScoreView
//
//  Created by 姚旭辉 on 16/4/19.
//  Copyright © 2016年 姚旭辉. All rights reserved.
//

#import "ViewController.h"
#import "MYScoreView.h"
#import "YYCustomScoreView.h"
#import "YYTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MYScoreView *scoreView;
@property (weak, nonatomic) IBOutlet YYCustomScoreView *customScore;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreView.score = 0.3;
    self.customScore.score = 4.0;
    self.customScore.isEable = YES;
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 400, 200, 10)];
    [self.view addSubview:self.progressView];
    self.progressView.progress = 0.4;
    
    __weak typeof(self) weakSelf = self;
    self.customScore.finishScoreBlock = ^(NSInteger newScore) {
        weakSelf.progressView.progress = newScore/5.0;
    };
}
- (IBAction)changeSlider:(UISlider *)sender {
    self.customScore.score = sender.value;
}


- (IBAction)onClickPush:(UIButton *)sender {
    YYTableViewController *tableView = [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewVC"];
    [self.navigationController pushViewController:tableView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
