//
//  KTPPLvYouModel.h
//  KTSlidView
//
//  Created by Kevin Tan on 2020/6/29.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTPPLvYouModel : NSObject


@property (nonatomic,strong)NSString * relation;    // null,
@property (nonatomic,strong)NSString * activeState;    // null,
@property (nonatomic,strong)NSString * lastTime;    // null,
@property (nonatomic,assign)BOOL sex;    // 1,
@property (nonatomic,strong)NSString * distanceDesc;    // null,
@property (nonatomic,strong)NSString * lng;    // null,
@property (nonatomic,strong)NSString * signature;    // null,
@property (nonatomic,strong)NSString * degree;    // null,
@property (nonatomic,strong)NSString * userExposureId;    // null,
@property (nonatomic,strong)NSString * recentIssueDesc;    // null,
@property (nonatomic,strong)NSString * id;    // 15317689,
@property (nonatomic,assign)NSInteger  cityCount;    // 1,
@property (nonatomic,assign)NSInteger  countryCount;    // 1,
@property (nonatomic,strong)NSString * roles;    // null,
@property (nonatomic,strong)NSString * labelList;    // null,
@property (nonatomic,strong)NSString * distance;    // null,
@property (nonatomic,strong)NSString * lat;    // null,
@property (nonatomic,strong)NSString * age;    // 26,
@property (nonatomic,strong)NSString * rolesList;    // null,
@property (nonatomic,strong)NSString * userName;    // 我的昵称哈哈,
@property (nonatomic,strong)NSString * photo;    // \/file\/photoImg\/20191016\/1910160477143173.jpg
@property (nonatomic,strong)NSString * desc;    // 你们共同去过:上海 中国 中国 中国 中国 中国 ,
@property (nonatomic,strong)NSString * activeStateDescribe;    // null,
@property (nonatomic,strong)NSString * provinceCount;    // 1,
@property (nonatomic,strong)NSString * recentIssue;    // null


@property (nonatomic, copy) NSString *name;//!< 框架名
@property (nonatomic, copy) NSString *brief;//!< 框架简介
@property (nonatomic, copy) NSString *discription;//!< 框架详细介绍
@property (nonatomic, copy) NSString *logo;//!< logo
@property (nonatomic, copy) NSString *backgroundImage;//!< 占位背景图
@property (nonatomic, copy) NSString *backgroundColor;//!< 背景颜色
@property (nonatomic, copy) NSString *url;//!< url

//- (instancetype)initWithDic:(NSDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
