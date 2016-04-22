//
//  MYScoreView.m
//  MYScoreView
//
//  Created by 姚旭辉 on 16/4/19.
//  Copyright © 2016年 姚旭辉. All rights reserved.
//

#import "MYScoreView.h"

@interface MYScoreView ()

@property (nonatomic, strong) UIView *foreView;
@property (nonatomic, strong) NSLayoutConstraint *widthConstraint;

@end

@implementation MYScoreView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor redColor];
        [backView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:backView];
        NSArray *constraint_back_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(backView)];
        NSArray *constraint_back_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(backView)];
        [self addConstraints:constraint_back_H];
        [self addConstraints:constraint_back_V];
        
        
        [self addSubview:self.foreView];
        NSArray *constraint_fore_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_foreView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_foreView)];
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.foreView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
        self.widthConstraint = [NSLayoutConstraint constraintWithItem:self.foreView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];

        [self addConstraints:constraint_fore_V];
        [self addConstraint:leftConstraint];
        [self addConstraint:self.widthConstraint];
    }
    return self;
}

- (void)setScore:(CGFloat)score {
    [self removeConstraint:self.widthConstraint];
    self.widthConstraint = [NSLayoutConstraint constraintWithItem:self.foreView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:score constant:0];
    [self addConstraint:self.widthConstraint];
}

- (UIView *)foreView {
    if (!_foreView) {
        _foreView = [[UIView alloc] init];
        _foreView.backgroundColor = [UIColor orangeColor];
        [_foreView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _foreView;
}

@end
