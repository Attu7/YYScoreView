//
//  YYCustomScoreView.m
//  MYScoreView
//
//  Created by 姚旭辉 on 16/4/21.
//  Copyright © 2016年 姚旭辉. All rights reserved.
//

#define LIGHT_STAR @"pingjia_dianjida"
#define DARK_STAR @"pingjia_weidianda"
#define IMAGE_TAG_MARGIN 15.0

#import "YYCustomScoreView.h"

@implementation YYCustomScoreView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpCustomScoreView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpCustomScoreView];
    }
    return self;
}

- (void)setUpCustomScoreView {
    NSArray *tagArray = @[@"差", @"一般", @"满意", @"很满意", @"推荐"];
    UIImage *starImage = [UIImage imageNamed:DARK_STAR];
    CGFloat starWidth = starImage.size.width;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:starImage];
    imageView.tag = 450;
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:imageView];
    
    NSLayoutConstraint *constraint_image_Top = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)];
    [self addConstraint:constraint_image_Top];
    [self addConstraints:constraint_H];
    
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.text = tagArray[0];
    tagLabel.textAlignment = NSTextAlignmentCenter;
    tagLabel.font = [UIFont systemFontOfSize:15.0f];
    [tagLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:tagLabel];
    NSLayoutConstraint *constraint_label_CenterX = [NSLayoutConstraint constraintWithItem:tagLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint_label_Top = [NSLayoutConstraint constraintWithItem:tagLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:IMAGE_TAG_MARGIN];
    NSLayoutConstraint *constraint_label_Height = [NSLayoutConstraint constraintWithItem:tagLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:10.0f];
    [self addConstraint:constraint_label_CenterX];
    [self addConstraint:constraint_label_Top];
    [self addConstraint:constraint_label_Height];
    
    for (int i=1; i<5; i++) {
        UIProgressView *progressView = [[UIProgressView alloc] init];
        progressView.tag = 549 + i;
        progressView.tintColor = [UIColor blueColor];
        [progressView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:progressView];
        UIView *preImageView = [self viewWithTag:449+i];
        NSLayoutConstraint *constraint_progress_Y = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:preImageView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0];
        NSLayoutConstraint *constraint_progress_Left = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:preImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint *constraint_progress_Width = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.25f constant:-1.25*starWidth];
        NSLayoutConstraint *constraint_progress_Height = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:5.0f];
        [self addConstraint:constraint_progress_Y];
        [self addConstraint:constraint_progress_Left];
        [self addConstraint:constraint_progress_Width];
        [self addConstraint:constraint_progress_Height];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:starImage];
        imageView.tag = i+450;
        [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        imageView.userInteractionEnabled = self.isEable;
        [self addSubview:imageView];
        
        NSLayoutConstraint *constraint_image_CenterY = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:progressView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0];
        NSLayoutConstraint *constraint_image_Left = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:progressView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self addConstraint:constraint_image_CenterY];
        [self addConstraint:constraint_image_Left];
        
        UILabel *tagLabel = [[UILabel alloc] init];
        tagLabel.text = tagArray[i];
        tagLabel.textAlignment = NSTextAlignmentCenter;
        tagLabel.font = [UIFont systemFontOfSize:15.0f];
        [tagLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:tagLabel];
        NSLayoutConstraint *constraint_tagLabel_Top = [NSLayoutConstraint constraintWithItem:tagLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:IMAGE_TAG_MARGIN];
        NSLayoutConstraint *constraint_tagLabel_CenterX = [NSLayoutConstraint constraintWithItem:tagLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        NSLayoutConstraint *constraint_tagLabel_Height = [NSLayoutConstraint constraintWithItem:tagLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:10.0f];
        [self addConstraint:constraint_tagLabel_Top];
        [self addConstraint:constraint_tagLabel_Height];
        [self addConstraint:constraint_tagLabel_CenterX];
    }
}

- (void)setIsEable:(BOOL)isEable {
    for (int i=0; i<5; i++) {
        UIImageView *imageView = [self viewWithTag:450 + i];
        imageView.userInteractionEnabled = isEable;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
        tapGesture.numberOfTapsRequired = 1;
        [imageView addGestureRecognizer:tapGesture];
    }
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    UIImageView *imageView = (UIImageView *)gesture.view;
    NSInteger newScore = (CGFloat)imageView.tag-450.0;
    if (_finishScoreBlock) {
        _finishScoreBlock(newScore);
    }
    for (int i=450; i<=imageView.tag;i++) {
        UIImageView *imageView = [self viewWithTag:i];
        imageView.image = [UIImage imageNamed:LIGHT_STAR];
        UIProgressView *progressView = [self viewWithTag:i+99];
        progressView.progress = 1.0f;
    }
    for (NSInteger i=imageView.tag+1; i<455; i++) {
        UIImageView *imageView = [self viewWithTag:i];
        imageView.image = [UIImage imageNamed:DARK_STAR];
        UIProgressView *progressView = [self viewWithTag:i+99];
        progressView.progress = 0;
    }
}

- (void)setScore:(CGFloat)score {
    for (int i=0; i<5; i++) {
        UIImageView *imageView = [self viewWithTag:450 + i];
        imageView.image = [UIImage imageNamed:DARK_STAR];
        UIProgressView *progressView = [self viewWithTag:550+i];
        progressView.progress = 0;
    }
    if (score <= 1 && score > 0) {
        UIImageView *imageView = [self viewWithTag:450];
        imageView.image = [UIImage imageNamed:LIGHT_STAR];
        return;
    }
    
    NSInteger intScore = (NSInteger)score;
    for (int i=0; i<intScore; i++) {
        UIImageView *imageView = [self viewWithTag:450+i];
        imageView.image = [UIImage imageNamed:LIGHT_STAR];
        UIProgressView *progressView = [self viewWithTag:549+i];
        progressView.progress = 1.0f;
    }
    UIProgressView *lastProView = [self viewWithTag:549 + intScore];
    lastProView.progress = score-intScore;
}

@end
