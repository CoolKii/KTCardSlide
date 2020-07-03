//
//  KTPPCardViewCell.h
//  KTSlidView
//
//  Created by Kevin Tan on 2020/6/29.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KTPPCardViewCell,KTPPLvYouModel;

NS_ASSUME_NONNULL_BEGIN

@protocol KTPPCardViewCellDelagate <NSObject>

@optional
- (void)cardViewCellDidRemoveFromSuperView:(KTPPCardViewCell *)cell;
- (void)cardViewCellDidMoveFromSuperView:(KTPPCardViewCell *)cell forMovePoint:(CGPoint)point;

@end


typedef NS_ENUM(NSInteger,KTPPCardViewCellSwipeDirection) {
    KTPPCardViewCellSwipeDirectionLeft = 0,
    KTPPCardViewCellSwipeDirectionRight,
};



@interface KTPPCardViewCell : UIView


@property (nonatomic, strong) UIView *contentView;//!< 内容视图
@property (nonatomic, copy) NSString *reuseIdentifier;//!< 重用标识
@property (nonatomic, weak) UIImageView * showImgV;
@property (nonatomic, weak) KTPPLvYouModel * showModel;
@property (nonatomic, assign) CGFloat maxAngle;
@property (nonatomic, assign) CGFloat maxRemoveDistance;
@property (nonatomic, weak) id<KTPPCardViewCellDelagate> cell_delegate;

/*!
 @brief 初始化方法
 @param reuseIdentifier 复用id
 @return self
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

/*!
 @brief 移除cell
 @param direction 移除方向
 */
- (void)removeFromSuperviewSwipe:(KTPPCardViewCellSwipeDirection)direction;


@end

NS_ASSUME_NONNULL_END
