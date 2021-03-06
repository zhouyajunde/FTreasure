//
//  ShareContentView.m
//  WinTreasure
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "ShareContentView.h"

const CGFloat kShareImageWidth = 80.0;

@interface ShareContentView ()


@end

@implementation ShareContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _picImageView = [[UIImageView alloc]initWithFrame:({
            CGRect rect = {15,(self.height-kShareImageWidth)/2.0,kShareImageWidth,kShareImageWidth};
            rect;
        })];
        _picImageView.image = IMAGE_NAMED(@"添加图片");
        _picImageView.userInteractionEnabled = YES;
        @weakify(self);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            @strongify(self);
            if (self.addSharingImage) {
                self.addSharingImage();
            }
        }];
        [_picImageView addGestureRecognizer:tap];
        [self addSubview:_picImageView];
        
    }
    return self;
}

@end
