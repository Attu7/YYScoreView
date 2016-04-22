//
//  YYTableViewCell.h
//  MYScoreView
//
//  Created by 姚旭辉 on 16/4/21.
//  Copyright © 2016年 姚旭辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYCustomScoreView.h"

@interface YYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet YYCustomScoreView *custScoreView;

- (void)configCell:(CGFloat)score;

@end
