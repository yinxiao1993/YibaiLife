//
//  City.h
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface City : UIViewController<UIScrollViewDelegate>
{
    
    UIPageControl *pagecontrol;//滚动页面控制器
    UIScrollView *bgScrollView;//创建一个大的滚动视图
    UIScrollView *ScrollView;
    UIButton *bttitleleft1;
    UIImageView *imagetitle;
    UILabel *label;
    
    //创建四个红色小按钮
    UIButton *redbt1;
    UIButton *redbt2;
    UIButton *redbt3;
    UIButton *redbt4;
    
    
    NSTimer *timer;
    int add;
    int yemian1;
    int yemian4;
    int current;
    int isbitbutton_1;
    int isbitbutton_1_1;
    

}

@end
