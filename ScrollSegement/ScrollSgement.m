//
//  ScrollSgement.m
//  PhotoAlbum
//
//  Created by apple on 13-6-19.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ScrollSgement.h"

@implementation ScrollSgement

UIImageView *selectImgV;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame itemTitles:(NSArray*)itemTitles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        for (int i=0; i<itemTitles.count; i++) {
            UIButton *btnTitle=[UIButton buttonWithType:UIButtonTypeCustom];
            btnTitle.tag=i+100;
            btnTitle.frame=CGRectMake(65*i, 0, 65, 35);
            [btnTitle setTitle:[itemTitles objectAtIndex:i] forState:UIControlStateNormal];
            [btnTitle addTarget:self action:@selector(btnTitleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTitle];
            
        }
        self.delegate=self;
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setContentSize:CGSizeMake(65*itemTitles.count, 35)];
        [self setBounces:YES];
        
        selectImgV=[[UIImageView alloc] initWithImage:nil];
        selectImgV.frame=CGRectMake(0, 0, 65, 35);
        selectImgV.tag=10001;
        selectImgV.alpha=0.6;
        selectImgV.backgroundColor=[UIColor blackColor];
        [self addSubview:selectImgV];
        // Initialization code
    }
    return self;
}

-(void)btnTitleClick:(id)sender{
    DebugNSLog(@"%d",((UIButton*)sender).tag);
    [UIView animateWithDuration:0.5 animations:^{
        selectImgV.center=((UIButton*)sender).center;
    } completion:^(BOOL finished) {
        [_ssdelegate didSelectScrollSgementForIndex:((UIButton*)sender).tag%100];
    }];
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
