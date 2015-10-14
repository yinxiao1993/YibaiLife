//
//  PickerVIewVC.h
//  yibaiTest
//
//  Created by mac on 15-10-13.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerVIewVC : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIPickerView *picker;//创建一个选择器,用来选择城市
    NSMutableDictionary *CityShengAndshi;//创建一个可变字典,用来存放省和市
    NSMutableArray *CitySheng;
    NSMutableArray *CityShi;
    UIButton *bttitleleft1;
    UIImageView * imagetitle;//创建一个标题图片
    UIImageView * imageCityBg;//创建一个标题图片
    UIView *view1;
    
}

@end
