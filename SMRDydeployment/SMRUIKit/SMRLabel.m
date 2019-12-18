//
//  SMRLabel.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/28.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRLabel.h"
#import "PureLayout.h"

@interface SMRLabel ()

@property (assign, nonatomic) BOOL didLoadLayout;

@end

@implementation SMRLabel

@synthesize backImageView = _backImageView;
@synthesize contentInsets = _contentInsets;
@synthesize textLabel = _textLabel;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    [self addSubview:self.backImageView];
    [self addSubview:self.textLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didLoadLayout) {
        self.didLoadLayout = YES;

         [NSLayoutConstraint autoSetPriority:UILayoutPriorityDefaultHigh forConstraints:^{
             [self.textLabel autoPinEdgesToSuperviewEdgesWithInsets:self.contentInsets];
         }];
         [self.backImageView autoPinEdgesToSuperviewEdges];
    }
    [super updateConstraints];
}

#pragma mark - Setters

#pragma mark - Getters

- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
    }
    return _backImageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
    }
    return _textLabel;
}

@end
