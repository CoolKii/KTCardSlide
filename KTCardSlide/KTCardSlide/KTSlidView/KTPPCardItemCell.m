//
//  KTPPCardItemCell.m
//  KTSlidView
//
//  Created by Kevin Tan on 2020/6/29.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTPPCardItemCell.h"
//#import <MTSDWebImage/MTSDWebImage.h>
//#import <MTMasonry/MTMasonry.h>


@interface KTPPCardItemCell ()


@property (nonatomic, strong) UIView * container;//!< 容器
@property (nonatomic, strong) UIImageView * topImgView;//!< 上背景占位图
@property (nonatomic, strong) UIView * bottomContainer;//!< 底部容器
@property (nonatomic, strong) UILabel * nameLabel;//!< 名称标签
@property (nonatomic, strong) UIView * sexageContainer;//!< 性别容器
@property (nonatomic, strong) UILabel * ageLab;//!< 年龄
@property (nonatomic, strong) UIImageView * sexImgView;//!<性别
@property (nonatomic, strong) UILabel * chengguoLab;//!< 城市国家
@property (nonatomic, strong) UILabel * discriptionLabel;//!< 详细介绍
@property (nonatomic, strong) UIButton * button;//!< 点击按钮


@end


@implementation KTPPCardItemCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
        
        _container = [[UIView alloc] initWithFrame:self.contentView.bounds];
        _container.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_container];
        
        _bottomContainer = [[UIView alloc] init];
        [_container addSubview:_bottomContainer];
//        [_bottomContainer mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.mas_equalTo(_container).offset(0);
//            make.height.mas_equalTo(80);
//        }];
        
        _topImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_container addSubview:_topImgView];
//        [_topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.right.mas_equalTo(_container);
//            make.bottom.mas_equalTo(_bottomContainer.mas_top).offset(0);
//        }];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _nameLabel.font = UIPFMediumFont(15);
        _nameLabel.textAlignment = NSTextAlignmentLeft;
//        _nameLabel.textColor = kAppBlackColor2;
        [_bottomContainer addSubview:_nameLabel];
        
        //性别 年龄
        _sexageContainer = [[UIView alloc] initWithFrame:CGRectZero];
        [_bottomContainer addSubview:_sexageContainer];
        _sexImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_sexageContainer addSubview:_sexImgView];
        _ageLab = [[UILabel alloc] initWithFrame:CGRectZero];
//        _ageLab.font = UIPFMediumFont(10);
//        _ageLab.textColor = kAppWhiteColor;
        _ageLab.textAlignment = NSTextAlignmentCenter;
        [_sexageContainer addSubview:_ageLab];
        
        //
        _chengguoLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _chengguoLab.font = [UIFont systemFontOfSize:16.0];
        _chengguoLab.textAlignment = NSTextAlignmentLeft;
        _chengguoLab.textColor = [UIColor grayColor];
        [_bottomContainer addSubview:_chengguoLab];
        
        _discriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _discriptionLabel.font = UIPFRegularFont(12);
        _discriptionLabel.textAlignment = NSTextAlignmentLeft;
//        _discriptionLabel.textColor = kAppGrayColor;
        [_bottomContainer addSubview:_discriptionLabel];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews {
    _container.frame = self.contentView.bounds;
    
    _topImgView.frame = CGRectMake(.0, .0, _container.frame.size.width, _container.frame.size.height - 80);
    _topImgView.layer.cornerRadius = 5.0;
    _topImgView.layer.masksToBounds = YES;
    _topImgView.backgroundColor = UIColor.redColor;
    
    _bottomContainer.frame = CGRectMake(0, CGRectGetMaxY(_topImgView.frame), _container.frame.size.width, 80);
    
    _nameLabel.frame = CGRectMake(14, 11.5, 100, 21.0);
    _sexageContainer.frame = CGRectMake(110, 14, 36, 16);
    _sexageContainer.layer.cornerRadius = 8.0;
    _sexageContainer.layer.masksToBounds = YES;
    _sexImgView.frame = CGRectMake(6, 3, 10, 10);
    _ageLab.frame = CGRectMake(16, 1, 18, 14);
    
    _chengguoLab.frame = CGRectMake(14, CGRectGetMaxY(_nameLabel.frame), _container.frame.size.width, 20.0);
    
    _discriptionLabel.frame = CGRectMake(14.0, CGRectGetMaxY(_chengguoLab.frame) ,168,16.5);
    
    _button.frame = CGRectMake(.0, .0, _container.frame.size.width, 253.0);
}

- (void)setCellData:(KTPPLvYouModel *)model {
    self.showModel = model;
    NSString * the_ShowIMg = model.photo;
//    [self.topImgView sd_setImageWithURL:[NSURL URLWithString:ImageURL(the_ShowIMg)] placeholderImage:[UIImage imageNamed:PlaceHoldImage]];
    self.topImgView.image = [UIImage imageNamed:the_ShowIMg];
//    [self.topImgView sd_setImageWithURL:[NSURL URLWithString:ImageURL(the_ShowIMg)]];
    self.showImgV = self.topImgView;//
    NSString * name = [NSString stringWithFormat:@"%@",model.userName];
//    CGSize theNameSize = kGetTempSize(CGSizeMake(MAXFLOAT, 21), name, UIPFMediumFont(15));
    CGFloat width = 110;//theNameSize.width + 8;
    if (width > 120) {
        width = 120;
    }
    self.nameLabel.text = name;
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.bottomContainer.mas_left).offset(14);
//        make.top.mas_equalTo(self.bottomContainer.mas_top).offset(11.5);
//        make.size.mas_equalTo(CGSizeMake(width, 21.0));
//    }];
//    [self.sexageContainer mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.nameLabel.mas_centerY).offset(0);
//        make.left.mas_equalTo(self.nameLabel.mas_right).offset(5);
//        make.size.mas_equalTo(CGSizeMake(36, 16));
//    }];
    self.ageLab.text = model.age;
    if (model.sex) {//男
//        self.sexageContainer.backgroundColor = UICOLOR_HEX(0x00A0FF);
        self.sexImgView.image = [UIImage imageNamed:@"pipei_boy"];
    }else{
//        self.sexageContainer.backgroundColor = UICOLOR_HEX(0xFF3B30);
        self.sexImgView.image = [UIImage imageNamed:@"pipei_girl"];
    }
    
    //
    self.chengguoLab.attributedText = [self guo:model.countryCount AndCheng:model.cityCount];
    //
    self.discriptionLabel.text = model.desc;
}

- (void)buttonClicked:(UIButton *)sender {
    if (_buttonClicked) {
        _buttonClicked(sender);
    }
}

#pragma mark - Data
- (NSMutableAttributedString *)guo:(NSInteger)guo AndCheng:(NSInteger)cheng{
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] init];
//    NSDictionary * arrDic = [NSDictionary dictionaryWithObjectsAndKeys:UIPFRegularFont(kAppWidth_6(10.0)),NSFontAttributeName,kAppGrayColor,NSForegroundColorAttributeName, nil];
//    if (guo > 0) {
//        UIImage *icon = [UIImage imageNamed:@"tj_xq"];
//        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
//        attachment.image = icon;
//        attachment.bounds = CGRectMake(0.0f,-kAppWidth_6(4.0f), kAppWidth_6(20.0f), kAppWidth_6(17.0f));
//        [content appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
//        [content appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %ld国 ",guo] attributes:arrDic]];
//    }
//
//    if (cheng > 0) {
//        UIImage *icon = [UIImage imageNamed:@"tj_gj"];
//        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
//        attachment.image = icon;
//        attachment.bounds = CGRectMake(0.0f,-kAppWidth_6(7.0f), kAppWidth_6(20.0f), kAppWidth_6(20.0f));
//        [content appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
//        [content appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %ld城 ",cheng] attributes:arrDic]];
//    }
    return content;
}

@end
