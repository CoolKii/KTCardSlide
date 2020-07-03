//
//  KTPPCardItemCell.h
//  KTSlidView
//
//  Created by Kevin Tan on 2020/6/29.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTPPCardViewCell.h"
#import "KTPPCardView.h"
#import "KTPPLvYouModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface KTPPCardItemCell : KTPPCardViewCell

@property (nonatomic, strong) KTPPLvYouModel * cellData;//!< 模型数据
@property (nonatomic, copy) void (^buttonClicked)(UIButton *);//!< 按钮点击回调


@end

NS_ASSUME_NONNULL_END
