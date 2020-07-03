//
//  KTSlideVC.m
//  KTCardSlide
//
//  Created by Kevin Tan on 2020/7/3.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTSlideVC.h"
#import "KTPPCardView.h"

#define SCREEN_Width [UIScreen mainScreen].bounds.size.width
#define SCREEN_Height [UIScreen mainScreen].bounds.size.height

@interface KTSlideVC ()<KTPPCardViewDataSource, KTPPCardViewCellDelagate>

@property (nonatomic,strong)UIImageView * bgImgV;
@property (nonatomic,strong)KTPPCardView * cardView;

@end

static NSString * const ktCardCellId = @"KT_CardCellId";

@implementation KTSlideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.bgImgV];
    //实现模糊效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];;
    effectView.frame = CGRectMake(0, 0, SCREEN_Width, SCREEN_Height);
    [self.view addSubview:effectView];
    [self.view insertSubview:self.bgImgV atIndex:0];
    [self.view insertSubview:effectView atIndex:1];
    
    
    self.cardView.frame = CGRectMake(80, 200, SCREEN_Width - 160, 375);
    [self.view addSubview:self.cardView];
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(80, SCREEN_Height - 164, 50, 30);
    [leftBtn addTarget:self action:@selector(btnClickMedth:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:@"左翻" forState:UIControlStateNormal];
    [self.view addSubview:leftBtn];
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(SCREEN_Width - 50 - 80, SCREEN_Height - 164, 50, 30);
    [rightBtn addTarget:self action:@selector(btnClickMedth:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"右翻" forState:UIControlStateNormal];
    [self.view addSubview:rightBtn];
    
}

- (void)btnClickMedth:(UIButton*)btn{
    if ([btn.titleLabel.text containsString:@"左"]) {
        [self.cardView removeTopCardViewFromSwipe:KTPPCardViewCellSwipeDirectionLeft];
    }else{
        [self.cardView removeTopCardViewFromSwipe:KTPPCardViewCellSwipeDirectionRight];
    }
}


#pragma mark - QiCardViewDataSource
- (KTPPCardItemCell *)cardView:(KTPPCardView *)cardView cellForRowAtIndex:(NSInteger)index {
    KTPPCardItemCell * cell = [cardView dequeueReusableCellWithIdentifier:ktCardCellId];
    cell.cellData = self.dataArray[index];
    cell.buttonClicked = ^(UIButton *sender) {
        
    };
    return cell;
}

-(NSInteger)numberOfCountInCardView:(KTPPCardView *)cardView{
    return self.dataArray.count;
}


#pragma mark - QiCardViewDelegate
- (void)cardView:(KTPPCardView *)cardView didRemoveLastCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index {//已经移除了最后一个cell
    [self.cardView reloadData];
}

- (void)cardView:(KTPPCardView *)cardView didRemoveCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index {//移除了某个cell
    NSLog(@"didRemoveCell forRowAtIndex = %ld", index);
}

- (void)cardView:(KTPPCardView *)cardView didDisplayCell:(KTPPCardViewCell *)cell forRowAtIndex:(NSInteger)index {
}

- (void)cardView:(KTPPCardView *)cardView didMoveCell:(KTPPCardViewCell *)cell forMovePoint:(CGPoint)point {
    NSLog(@"move point = %@", NSStringFromCGPoint(point));
}

#pragma mark - lazyLoading
-(UIImageView *)bgImgV{
    if (!_bgImgV) {
        _bgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
        _bgImgV.image = [UIImage imageNamed:@""];
        _bgImgV.backgroundColor = UIColor.orangeColor;
        _bgImgV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bgImgV;
}

-(KTPPCardView *)cardView{
    if (!_cardView) {
        _cardView = [[KTPPCardView alloc] initWithFrame:CGRectMake(60.0, 160.0, SCREEN_Width - 120.0, 352.0)];
        _cardView.backgroundColor = [UIColor clearColor];//为了指出carddView的区域，指明背景色
        _cardView.dataSource = self;
        _cardView.delegate = (id)self;
        _cardView.visibleCount = 8;
        _cardView.lineSpacing = 3;
        _cardView.interitemSpacing = 4.5;
        _cardView.maxAngle = 10.0;
        _cardView.isAlpha = YES;
        _cardView.maxRemoveDistance = 100.0;
        _cardView.layer.cornerRadius = 10.0;
        [_cardView registerClass:[KTPPCardItemCell class] forCellReuseIdentifier:ktCardCellId];
    }
    return _cardView;
}

@end
