//
//  Sweater.h
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sweater : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>
{
    UIPageControl *pagecontrol;//滚动页面控制器
    UIButton *bttitleleft1;//添加标题左侧按钮
    UIButton *bttitleright;//添加标题右侧按钮
    
    UIImageView *imagetitle;//添加标题图片

    UILabel *label;//添加标题中心的标签

    
    UIScrollView *ScrollView1;//创建滚动视图

    
    
    
    NSMutableArray * tablemutablearray; //创建第一个界面的可变数组
    NSMutableArray * baiyunmutablearray; //创建第二个界面的可变数组
    NSMutableArray * yudimutablearray; //创建第三个界面的可变数组
    NSMutableArray * snowmutablearray; //创建第四个界面的可变数组
    
    
    
    //创建第一个页面的图片
    UIImageView *imageview1_1;
    UIImageView *imageview1_2;
    UIImageView *imageview1_3;
    
    NSTimer *timer1;//定时器,定时创建云彩
    NSTimer *timer2;//定时器,定时创建雨滴
    NSTimer *timer3;//定时器,定时创建雪花
    
    
    UIImageView *imageview2_1;
    UIImageView *imageview2_2;
    int imageview2_2count;
    UIImageView *imagebg2;//第二张的背景图片
    UIImageView *imagebg3;//第三张的背景图片
    UIImageView *imagebg4;//第四张的背景图片

    
  
    
    UIImageView *imageview3_1;
    
    
    UIButton *tianqibt;
    
    
    int isbitRight;//判断白天和黑夜的按钮
    
    int isxianshi;//判断第一张页面显示的东西
    
    
    UIScrollView *currentSV;//创建一个全局变量,用来接收当前显示的时滚动视图的第几个视图
    
    int numpage;//判断是第几个视图
    
}

@end
