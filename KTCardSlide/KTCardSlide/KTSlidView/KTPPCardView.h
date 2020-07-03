//
//  KTPPCardView.h
//  KTSlidView
//
//  Created by Kevin Tan on 2020/6/29.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTPPCardItemCell.h"
#import "KTPPLvYouModel.h"

NS_ASSUME_NONNULL_BEGIN

@class KTPPCardView;

@protocol KTPPCardViewDataSource<NSObject>

@required
- (NSInteger)numberOfCountInCardView:(KTPPCardView *)cardView;
- (KTPPCardViewCell *)cardView:(KTPPCardView *)cardView cellForRowAtIndex:(NSInteger)index;

@end


@protocol KTPPCardViewDelegate<NSObject>

@optional
- (void)cardView:(KTPPCardView *)cardView didRemoveCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index;
- (void)cardView:(KTPPCardView *)cardView didRemoveLastCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index;
- (void)cardView:(KTPPCardView *)cardView didTapClickCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index;
- (void)cardView:(KTPPCardView *)cardView didDisplayCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index;
- (void)cardView:(KTPPCardView *)cardView didMoveCell:(KTPPCardViewCell *)cell forMovePoint:(CGPoint)point;


@end

@interface KTPPCardView : UIView


@property (nonatomic, readonly) NSArray<__kindof KTPPCardViewCell *> *visibleCells;//!< 当前可视cells
@property (nonatomic, readonly) NSInteger currentFirstIndex;//!< 当前显示最上层索引
@property (nonatomic, weak) id <KTPPCardViewDataSource> dataSource;//!< 数据源
@property (nonatomic, weak) id <KTPPCardViewDelegate> delegate;//!< 代理
@property (nonatomic, assign) NSInteger visibleCount;//!< 卡片可见数量(默认3)
@property (nonatomic, assign) CGFloat lineSpacing;//!< 行间距(默认10.0，可自行计算scale比例来做间距)
@property (nonatomic, assign) CGFloat interitemSpacing;//!< 列间距(默认10.0，可自行计算scale比例来做间距)
@property (nonatomic, assign) CGFloat maxAngle;//!< 侧滑最大角度(默认15°)
@property (nonatomic, assign) CGFloat maxRemoveDistance;//!< 最大移除距离(默认屏幕的1/4)
@property (nonatomic, assign) BOOL isAlpha;//!< cardCell是否需要透明度（默认YES）

//! 重载数据
- (void)reloadData;
- (void)reloadDataAnimated:(BOOL)animated;

//! 注册cell
- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier;

//! 获取缓存cell
- (__kindof KTPPCardViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

//! 获取index对应的cell
- (nullable __kindof KTPPCardViewCell *)cellForRowAtIndex:(NSInteger)index;

//! 获取cell对应的index
- (NSInteger)indexForCell:(KTPPCardViewCell *)cell;

//! 移除最上层cell
- (void)removeTopCardViewFromSwipe:(KTPPCardViewCellSwipeDirection)direction;


@end

NS_ASSUME_NONNULL_END
