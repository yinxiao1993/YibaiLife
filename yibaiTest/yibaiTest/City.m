//
//  City.m
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "City.h"
#import "FirstViewController.h"

@interface City ()

@end

@implementation City

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    add = 1;
    isbitbutton_1 = 0;
    isbitbutton_1_1 = 0;
    
 
    [self CreateTitle];
    [self CreatebgScroll];
    [self CreateScrollAndPagecontroll];
    [self CreatePagecontrll];
    [self Createanniu];
   // [self CreateShezhi];

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Timermove) userInfo:nil repeats:YES];
    current = 1;
    
    
    
    redbt1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    //redbt1.center = CGPointMake(200, 360);
    redbt1.center = CGPointMake(280, 440);
    redbt1.tag = 1;
    //交通
    [redbt1 setBackgroundImage:[UIImage imageNamed:@"c_setting0.png"] forState:UIControlStateNormal];
    [redbt1 addTarget:self action:@selector(bitbutton__1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    redbt2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
   // redbt2.center = CGPointMake(280, 360);
    redbt2.center = CGPointMake(280, 440);
    redbt2.tag = 2;
    //美食
    [redbt2 setBackgroundImage:[UIImage imageNamed:@"c_setting1.png"] forState:UIControlStateNormal];
    [redbt2 addTarget:self action:@selector(bitbutton__1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    redbt3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    //redbt3.center = CGPointMake(200, 440);
    redbt3.center = CGPointMake(280, 440);
    redbt3.tag = 3;
    //酒店
    [redbt3 setBackgroundImage:[UIImage imageNamed:@"c_setting2.png"] forState:UIControlStateNormal];
    [redbt3 addTarget:self action:@selector(bitbutton__1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    redbt4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    redbt4.center = CGPointMake(280, 440);
    redbt4.tag = 4;
    
    [redbt4 setBackgroundImage:[UIImage imageNamed:@"c_setting3.png"] forState:UIControlStateNormal];
    [redbt4 addTarget:self action:@selector(bitbutton__4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redbt4];
    
    
    
   
}

-(void)CreateTitle
{
    
    //添加标题图片
    imagetitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320,50)];
    imagetitle.backgroundColor = [UIColor redColor];
    imagetitle.image = [UIImage imageNamed:@"commonNavBar@2x.png"];
    [self.view addSubview:imagetitle];
    
    
    //添加标题
    label = [[UILabel alloc] initWithFrame:CGRectMake(120,0, 100, 50)];
    label.text = @"城市";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    [imagetitle addSubview:label];
    
    
    //添加标题左侧按钮
    bttitleleft1 = [[UIButton alloc] initWithFrame:CGRectMake(20,30, 30, 30)];
    bttitleleft1.backgroundColor = [UIColor clearColor];
    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 20, 20)];
    imageview1.image = [UIImage imageNamed:@"back@2x.png"];
    [bttitleleft1 addTarget:self action:@selector(bitbutton) forControlEvents:UIControlEventTouchUpInside];
    [bttitleleft1 addSubview:imageview1];
    [self.view addSubview:bttitleleft1];
}

-(void)CreatebgScroll
{
    bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, 320, 680)];
    bgScrollView.contentSize = CGSizeMake(320, 1000);
    bgScrollView.backgroundColor =[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    //bgScrollView.backgroundColor= [UIColor grayColor];
    bgScrollView.showsHorizontalScrollIndicator = YES;//显示滚动条
    bgScrollView.showsVerticalScrollIndicator = YES;//设置上下滚动
    //bgScrollView.delegate = self;
   //bgScrollView.bounces = YES;
   
    [self.view addSubview:bgScrollView];
    
}
-(void)CreateScrollAndPagecontroll
{
    ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    ScrollView.contentSize = CGSizeMake(320*4, 150);
    ScrollView.showsHorizontalScrollIndicator = YES;//显示滚动条
    ScrollView.showsVerticalScrollIndicator = YES;//设置上下滚动
    ScrollView.delegate = self;
    ScrollView.pagingEnabled = YES;
    ScrollView.bounces = NO;
    
    for (int i = 1; i < 5; i++)
    {
        NSString *str= [NSString stringWithFormat:@"%d.jpg",i];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(320*(i-1), 0, 320, 160)];
        imageview.image = [UIImage imageNamed:str];
        [ScrollView addSubview:imageview];
    }
    [bgScrollView addSubview:ScrollView];
    
}
-(void)CreatePagecontrll
{
    pagecontrol =[[UIPageControl alloc] initWithFrame:CGRectMake(110, 140, 100, 20)];
    pagecontrol.numberOfPages = 4;
    [pagecontrol addTarget:self action:@selector(setmove:) forControlEvents:UIControlEventValueChanged];
    pagecontrol.tintColor = [UIColor blackColor];
    pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];
    pagecontrol.pageIndicatorTintColor = [UIColor blackColor];
    [bgScrollView addSubview:pagecontrol];
    
    
}

//创建滚动视图下面的按钮
-(void)Createanniu
{
    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j<3; j++)
        {
            //
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 60, 60)];
           // button.backgroundColor = [UIColor redColor];
            button.center = CGPointMake(35*(j+1)+60*j+30, 30*(i+1)+60*i+30+150);
            int k = 3*i+j+1;
            NSString *str = [NSString stringWithFormat:@"c_%d.png",k];
            [button setBackgroundImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
           // [button addTarget:self action:@selector(bitbutton_1:) forControlEvents:UIControlEventTouchUpInside];
            [bgScrollView addSubview:button];
            
            
        }
        
    }
    
    
}
-(void)bitbutton__1:(UIButton *)bt
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    redbt3.center = CGPointMake(200, 440);
    redbt2.center = CGPointMake(280, 360);
    redbt1.center = CGPointMake(200, 360);
    [UIView setAnimationDidStopSelector:@selector(twodonghau2)];
    [UIView commitAnimations];
    
    [self.view addSubview:redbt4];
    [self bitbutton__4];
   

    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int numpage = scrollView.contentOffset.x/320;
    pagecontrol.currentPage =numpage;
    
    
    
    
}
-(void)bitbutton
{
    FirstViewController *first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:nil];
    
    
}
-(void)setmove:(UIPageControl *)page
{
    int currentpage = page.currentPage;
    [ScrollView setContentOffset:CGPointMake(currentpage*320, 0) animated:YES];
    
    
    
    
}
-(void)bitbutton__4
{

        if (isbitbutton_1 == 0)
           {
               isbitbutton_1 = 1;
             
               [UIView beginAnimations:nil context:nil];
               [UIView setAnimationDuration:1.0];
               [UIView setAnimationDelegate:self];
               redbt3.center = CGPointMake(200, 440);
               redbt2.center = CGPointMake(280, 360);
               redbt1.center = CGPointMake(200, 360);
               [UIView setAnimationDidStopSelector:@selector(twodonghau1)];
               [UIView commitAnimations];
               [self.view addSubview:redbt3];
               [self.view addSubview:redbt2];
               [self.view addSubview:redbt1];
           }
    
           else
           {
               isbitbutton_1 = 0;
               [UIView beginAnimations:nil context:nil];
               [UIView setAnimationDuration:1.0];
               [UIView setAnimationDelegate:self];
               redbt3.center = CGPointMake(200, 440);
               redbt2.center = CGPointMake(280, 360);
               redbt1.center = CGPointMake(200, 360);
               [UIView setAnimationDidStopSelector:@selector(twodonghau2)];
               [UIView commitAnimations];
            
           }
    [self.view addSubview:redbt4];
}

-(void)twodonghau1
{
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
  
    redbt3.center = CGPointMake(220, 440);
    redbt2.center = CGPointMake(280, 380);
    redbt1.center = CGPointMake(220, 380);

    [UIView commitAnimations];
    
    
    [self.view addSubview:redbt3];
    [self.view addSubview:redbt2];
    [self.view addSubview:redbt1];
    
    
}
-(void)twodonghau2
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    
    redbt3.center = CGPointMake(280, 440);
    redbt2.center = CGPointMake(280, 440);
    redbt1.center = CGPointMake(280, 440);
    
    [UIView commitAnimations];
    
    
    
}
-(void)Timermove
{
    pagecontrol.currentPage = pagecontrol.currentPage + add;
    if (pagecontrol.currentPage >= 3||pagecontrol.currentPage<=0)
    {
        add = -add;
    }
    [ScrollView setContentOffset:CGPointMake(pagecontrol.currentPage*320, 0)];
                                                 
                                                 
                                                 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
