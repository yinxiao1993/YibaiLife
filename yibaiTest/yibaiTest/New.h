//
//  New.h
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface New : UIViewController
{
    
    UIImageView *imagebg;//背景图片
    UIImageView *imageview0;
    
    
    UILabel *label;
    UIImageView *imageviewxianshi;
    UIButton *bttitleleft1;

    UIButton *bttitleleft2;    //添加左侧下面按钮
    BOOL ISbitbttitleleft1;//判断标题上的左侧按钮是否被点击
    
    BOOL bittoutiao;
    
    
    UIImageView *imagetitle;
    
    NSArray *array;//定义一个数组,用来存放左侧的几个按钮
    UIButton *buttonleft;
   }
@property(nonatomic,retain)UIButton* buttonleft;
@end
