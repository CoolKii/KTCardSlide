//
//  ViewController.m
//  KTCardSlide
//
//  Created by Kevin Tan on 2020/7/3.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "ViewController.h"
#import "KTSlideVC.h"
#import <YYModel/YYModel.h>
#import "KTPPLvYouModel.h"

@interface ViewController ()

@property (nonatomic,strong)NSArray * modelArr;

@end





@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSArray * jsonArr = [self getJsonDataJsonname:@"jsonData"];
    NSArray * modelArr = [NSArray yy_modelArrayWithClass:[KTPPLvYouModel class] json:jsonArr];
    self.modelArr = modelArr;
    
    
}
- (IBAction)left_right_slide_btn_Click:(id)sender {
    KTSlideVC * slideVC = [[KTSlideVC alloc]init];
    //数组地址不同 但是里面的对象地址相同
    slideVC.dataArray = [NSMutableArray arrayWithArray:self.modelArr];
    [self.navigationController pushViewController:slideVC animated:YES];
}

- (id)getJsonDataJsonname:(NSString *)jsonname{
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonname ofType:@"geojson"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
        return nil;
    } else {
        return jsonObj;
    }
}





@end
