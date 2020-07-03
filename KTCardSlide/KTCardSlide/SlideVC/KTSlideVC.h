//
//  KTSlideVC.h
//  KTCardSlide
//
//  Created by Kevin Tan on 2020/7/3.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KTPPLvYouModel;



NS_ASSUME_NONNULL_BEGIN


@interface KTSlideVC : UIViewController

@property (nonatomic,strong) NSMutableArray <KTPPLvYouModel *> * dataArray;

@end

NS_ASSUME_NONNULL_END
