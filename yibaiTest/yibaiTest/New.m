//
//  New.m
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "New.h"
#import "FirstViewController.h"
@interface New ()

@end

@implementation New
@synthesize buttonleft;
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

   // bittoutiao = 1;

   // [self Createbg];
    
    [self Createbg];

    [self Createbgtwo];
    
    ISbitbttitleleft1 = 1;//开始的时候是点击的状态
}

-(void)Createbgtwo
{
    
    //添加第二个图片
    
    imageviewxianshi = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 410)];    //添加标题图片
    imagetitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320,50)];
    imagetitle.image = [UIImage imageNamed:@"commonNavBar@2x.png"];
    [imageviewxianshi setUserInteractionEnabled:YES];

    [imageviewxianshi addSubview:imagetitle];
    
    
    //添加标题
    label = [[UILabel alloc] initWithFrame:CGRectMake(120,20, 100, 50)];
    //label.text = @"新闻界面";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    [imageviewxianshi addSubview:label];
    
    
    //添加标题左侧按钮
    bttitleleft1 = [[UIButton alloc] initWithFrame:CGRectMake(20,30, 30, 30)];
    bttitleleft1.backgroundColor = [UIColor clearColor];
    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 30, 20)];
    imageview1.image = [UIImage imageNamed:@"n_menu@2x.png"];
    [bttitleleft1 addTarget:self action:@selector(bitbttitleleft1) forControlEvents:UIControlEventTouchUpInside];
    [bttitleleft1 addSubview:imageview1];
    [self xianshi];
    imageview0.image = [UIImage imageNamed:@"news_5.png"];
    label.text = @"头条";
}

#pragma mark 创建底层背景图片
-(void)Createbg
{
    //添加背景图片
    imagebg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320,480)];
    imagebg.image = [UIImage imageNamed:@"n_background@2x.png"];
    [self.view addSubview:imagebg];
    
    self.view.backgroundColor = [UIColor cyanColor];
    //创建左侧的一列按钮
    for (int i = 0; i < 6; i++)
    {
        buttonleft = [[UIButton alloc] initWithFrame:CGRectMake(50, 40, 240, 50)];
        buttonleft.center = CGPointMake(120, 35*(i+1)+40+30*i);
        buttonleft.backgroundColor = [UIColor clearColor];
        buttonleft.tag = i;
//        NSString *str = [NSString stringWithFormat:@"%d",i];
//        [buttonleft setTitle:str forState:UIControlStateNormal];
        [buttonleft addTarget:self action:@selector(bitbuttonleft:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:buttonleft];
        
    }
    
    //添加左侧下面按钮
    bttitleleft2 = [[UIButton alloc] initWithFrame:CGRectMake(20,430, 20, 20)];
    bttitleleft2.backgroundColor = [UIColor clearColor];
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageview2.image = [UIImage imageNamed:@"back@2x.png"];
    [bttitleleft2 addTarget:self action:@selector(bitbttitleleft2) forControlEvents:UIControlEventTouchUpInside];
    [bttitleleft2 addSubview:imageview2];
    [self.view addSubview:bttitleleft2];
    
   
}
-(void)movebg
{
    [imagebg removeFromSuperview];
    [bttitleleft2 removeFromSuperview];
    
}
-(void)movebgtwo
{
    [imageviewxianshi removeFromSuperview];
    [label removeFromSuperview];
    [bttitleleft1 removeFromSuperview];
    
    
    
    
}
-(void)xianshi
{
    imageview0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 320, 410)];
    [imageview0 setUserInteractionEnabled:YES];
    [imageviewxianshi addSubview:imageview0];
    [imageviewxianshi addSubview:imagetitle];
    [self.view addSubview:imageviewxianshi];
    [self.view addSubview:bttitleleft1];
    [self.view addSubview:label];
    
}


-(void)bitbuttonleft:(UIButton *)tempbt
{
    
    
    
    tempbt.backgroundColor = [UIColor grayColor];
    tempbt.alpha = 0.3;
  
    ISbitbttitleleft1 = 1;
    switch (tempbt.tag)
    {
        case 0:
        {
            bittoutiao = 1;
           
            imageview0.image = [UIImage imageNamed:@"news_5.png"];
            label.text = @"头条";
            
        }
            break;
        case 1:
        {
            bittoutiao = 1;
            
            imageview0.image = [UIImage imageNamed:@"news_1.png"];
            label.text = @"娱乐";
        
        }
           
            
            break;
        case 2:
        {
            bittoutiao = 1;
            imageview0.image = [UIImage imageNamed:@"news_3.png"];
            label.text = @"体育";
            
        }
            
           
            break;
        case 3:
        {
            bittoutiao = 1;
            imageview0.image = [UIImage imageNamed:@"news_4.png"];
            label.text = @"科技";
          
        }
           break;
        case 4:
        {
            bittoutiao = 1;
            imageview0.image = [UIImage imageNamed:@"news_5.png"];
            label.text = @"财经";
           
        }
            
            break;
        case 5:
        {
         
            bittoutiao = 1;
            imageview0.image = [UIImage imageNamed:@"news_6.png"];
            label.text = @"时尚";
            
        }
            
            break;
            
        default:
            break;
    }
    
    [self xianshi];
    [self tupianshanghua];
  
   
    
    

}
#pragma mark 图片发生位移
-(void)bitbttitleleft1
{
    [imageviewxianshi setUserInteractionEnabled:NO];
//    FirstViewController *first = [[FirstViewController alloc] init];
//    [self presentViewController:first animated:YES completion:nil];
    
    //点击按钮让新闻图片发生位移
  
    
    if (ISbitbttitleleft1 == 1)
    {
        
        ISbitbttitleleft1 = 0;
      
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        imageviewxianshi.frame = CGRectMake(200, 50, 120, 100);
        //imageview0.frame = CGRectMake(200, 170, 120, 100);
        //bttitleleft1 = [[UIButton alloc] initWithFrame:CGRectMake(20,30, 30, 30)];
        bttitleleft1.frame = CGRectMake(220, 130, 30, 30);
      //  label = [[UILabel alloc] initWithFrame:CGRectMake(120,20, 100, 50)];
        label.frame = CGRectMake(260, 120, 100, 50);
        [UIView commitAnimations];
        [self Createbg];
        [self Createbgtwo];
        NSLog(@"__111");
        [self CreatedonghouImageview];
         

        
    }
    else
    {
         ISbitbttitleleft1 = 1;
        NSLog(@"__222");
//        [self movebg];
//        [self movebgtwo];
        
       
        [self tupianshanghua];
        
        
        
        
    }
    
    
    
    
    
    
}

-(void)CreatedonghouImageview
{
    imageviewxianshi.frame = CGRectMake(200, 100, 120, 240);
   
    bttitleleft1.frame = CGRectMake(220, 130, 30, 30);
   
    label.frame = CGRectMake(260, 120, 100, 50);
}


-(void)tupianshanghua
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    imageviewxianshi.frame = CGRectMake(0, 0, 320, 460);
    //bttitleleft1 = [[UIButton alloc] initWithFrame:CGRectMake(20,30, 30, 30)];
    bttitleleft1.frame = CGRectMake(20,30, 30, 30);
    
    label.frame = CGRectMake(120, 20, 100, 50);
    [UIView commitAnimations];
    
}
-(void)bitbttitleleft2
{
        FirstViewController *first = [[FirstViewController alloc] init];
        [self presentViewController:first animated:YES completion:nil];
    
    
    
    
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
