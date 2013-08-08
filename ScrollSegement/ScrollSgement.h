//
//  ScrollSgement.h
//  PhotoAlbum
//
//  Created by apple on 13-6-19.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollSgementDelegate <NSObject>

-(void)didSelectScrollSgementForIndex:(NSInteger)index;

@end

@interface ScrollSgement : UIScrollView<UIScrollViewDelegate>

@property(nonatomic,assign)id<ScrollSgementDelegate> ssdelegate;

- (id)initWithFrame:(CGRect)frame itemTitles:(NSArray*)itemTitles;

@end
