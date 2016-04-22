//
//  YYCustomScoreView.h
//  MYScoreView
//
//  Created by 姚旭辉 on 16/4/21.
//  Copyright © 2016年 姚旭辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FinishScoreBlock)(NSInteger);

@interface YYCustomScoreView : UIView

@property (nonatomic, assign) CGFloat score;
@property (nonatomic, assign) BOOL isEable;
@property (nonatomic, copy) FinishScoreBlock finishScoreBlock;

@end
