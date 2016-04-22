//
//  YYTableViewCell.m
//  MYScoreView
//
//  Created by 姚旭辉 on 16/4/21.
//  Copyright © 2016年 姚旭辉. All rights reserved.
//

#import "YYTableViewCell.h"

@implementation YYTableViewCell

- (void)configCell:(CGFloat)score {
    self.custScoreView.score = score;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
