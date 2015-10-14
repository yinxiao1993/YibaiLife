//
//  Sweater.m
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "Sweater.h"
#import "FirstViewController.h"
#import "Wangluolianjie.h"
#import "PickerVIewVC.h"
@interface Sweater ()

@end

@implementation Sweater

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
    self.view.backgroundColor = [UIColor grayColor];
    
    isbitRight = 0;
    isxianshi = 1;
  
    
   
    [self CreateScrollView1];
    [self createleft];
    [self createright];
    [self CreateDiceng];
    [self CreatePagecontrll];
    [self CreateTianqibt];
    [self Createlabel];
    [self CreateTableView];
    
    
    [self Scrollview1animation];
    
    
    
    
    baiyunmutablearray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self CreateScrollView2];
    
    timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Scrollview2animation) userInfo:nil repeats:YES];
    
    
    yudimutablearray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self CreateScrollView3];
    
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Scrollview3animation) userInfo:nil repeats:YES];
    
    
    snowmutablearray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self CreateScrollView4];
    
    timer3 = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(Scrollview4animation) userInfo:nil repeats:YES];
    
}
#pragma mark 创建黑夜的图片


-(void)CreateScrollViewNight
{
    ScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    ScrollView1.contentSize = CGSizeMake(320*4, 120);
    ScrollView1.showsHorizontalScrollIndicator = YES;//显示滚动条
    ScrollView1.showsVerticalScrollIndicator = YES;//设置上下滚动
    ScrollView1.delegate = self;
    ScrollView1.pagingEnabled = YES;
    ScrollView1.bounces = NO;
    ScrollView1.clipsToBounds = YES;
    
    for (int i = 1; i < 5; i++)
    {
        NSString *str= [NSString stringWithFormat:@"weather%d.png",i];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(320*(i-1), 0, 320, 300)];
        imageview.image = [UIImage imageNamed:str];
        if (imageview.tag == 2)
        {
            [imageview removeFromSuperview];
        }
        [ScrollView1 addSubview:imageview];
    }
    
    [self.view addSubview:ScrollView1];
    
    //创建月亮闪动的动画
    
    [self Scrollview1animation];
}
//添加滚动视图
-(void)CreateScrollView1
{
    ScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    ScrollView1.contentSize = CGSizeMake(320*4, 120);
    ScrollView1.showsHorizontalScrollIndicator = YES;//显示滚动条
    ScrollView1.showsVerticalScrollIndicator = YES;//设置上下滚动
    ScrollView1.delegate = self;
    ScrollView1.pagingEnabled = YES;
    ScrollView1.bounces = NO;
    ScrollView1.clipsToBounds = YES;
    for (int i = 1; i < 5; i++)
    {
        NSString *str= [NSString stringWithFormat:@"weather%d.png",i];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(320*(i-1), 0, 320, 300)];
        imageview.image = [UIImage imageNamed:str];
        if (imageview.tag == 2)
        {
            [imageview removeFromSuperview];
        }
        [ScrollView1 addSubview:imageview];
    }
    
    [self.view addSubview:ScrollView1];
    
    //创建月亮闪动的动画
    
    
}
//四个页面的动画
-(void)Scrollview1animation
{
    for (int i = 1; i < 20; i++)
    {
        imageview1_1 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 50, 5, 5)];
        imageview1_1.center = CGPointMake(arc4random()%320, arc4random()%150);
        
        imageview1_1.animationImages = @[[UIImage imageNamed:@"w_sun1.png"],[UIImage imageNamed:@"w_sun2.png"]];
        imageview1_1.animationDuration = 1.0;
        [imageview1_1 startAnimating];
        [ScrollView1 addSubview:imageview1_1];
    }
    imageview1_2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 50, 80, 80)];
    imageview1_2.animationImages = @[[UIImage imageNamed:@"w_moon1.png"],[UIImage imageNamed:@"w_moon2.png"]];
    imageview1_2.animationDuration = 1.0;
    [imageview1_2 startAnimating];
    [ScrollView1 addSubview:imageview1_2];
}


#pragma mark 创建第二张scorllview上的图片
-(void)CreateScrollView2
{
    
    imagebg2 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 250)];
    imagebg2.image = [UIImage imageNamed:@"weather2.png"];
    imagebg2.clipsToBounds = YES;
    
    for (int a = 1;a < 10; a++)
    {
      
        imageview2_1 = [[UIImageView alloc] initWithFrame:CGRectMake(-80, arc4random()%150+50,80,40)];
        imageview2_1.image = [UIImage imageNamed:@"w_cloud.png"];
        
        imageview2_1.tag = 1;//"1"表示可以重用
        [baiyunmutablearray addObject:imageview2_1];
        [imagebg2 addSubview:imageview2_1];
        NSLog(@"__%d",baiyunmutablearray.count);
        
   
    }
    imageview2_2 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 50, 130, 130)];
    imageview2_2.animationImages = @[[UIImage imageNamed:@"w_sun1.png"],[UIImage imageNamed:@"w_sun2.png"]];
    imageview2_2.animationDuration = 1.0;
    [imageview2_2 startAnimating];
    [imagebg2 addSubview:imageview2_2];
    
    
    [ScrollView1 addSubview:imagebg2];
    
}
-(void)Scrollview2animation
{
//baiyunmutablearray.count
    for (int i = 0; i < baiyunmutablearray.count; i++)
    {
        UIImageView *baiyun_1 = [baiyunmutablearray objectAtIndex:i];
        if (baiyun_1.tag == 1)
        {
            // NSLog(@"__22");
            [UIView beginAnimations:nil context:(__bridge void *)(baiyun_1)];
            [UIView setAnimationDuration:4.0];
            [UIView setAnimationDelegate:self];
            //设置动画结束后的代理
            [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
            
            baiyun_1.frame = CGRectMake(350+arc4random()%50, arc4random()%150, 80, 40);
            [UIView commitAnimations];
            baiyun_1.tag = 2;
            break;
        }
        
        
        
        
    }
    
    
}
-(void)CreateScrollView3
{
    imagebg3 = [[UIImageView alloc] initWithFrame:CGRectMake(640, 0, 320, 300)];
    
    imagebg3.image = [UIImage imageNamed:@"weather3.png"];
    imagebg3.clipsToBounds = YES;
    [ScrollView1 addSubview:imagebg3];
    for (int a = 1; a < 300 ; a++)
    {
        
        imageview3_1 = [[UIImageView alloc] initWithFrame:CGRectMake(-50+arc4random()%370, -20,arc4random()%30,20)];
        imageview3_1.image = [UIImage imageNamed:@"w_rain.png"];
        
        imageview3_1.tag = 10;//"1"表示可以重用
        [yudimutablearray addObject:imageview3_1];
        [imagebg3 addSubview:imageview3_1];
        
    }
    
}
-(void)Scrollview3animation
{
    //baiyunmutablearray.count
    for (int i = 0; i < yudimutablearray.count; i++)
    {
        UIImageView *yudi_1 = [yudimutablearray objectAtIndex:i];
        if (yudi_1.tag == 10)
        {
            
            [UIView beginAnimations:nil context:(__bridge void *)(yudi_1)];
            [UIView setAnimationDuration:3.0];
            [UIView setAnimationDelegate:self];
            //设置动画结束后的代理
            [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
            
            yudi_1.frame = CGRectMake(-50+arc4random()%370, 250+arc4random()%40, 20, 20);
            [UIView commitAnimations];
            yudi_1.tag = 11;
            break;
        }
        
        
        
        
    }
    
    
}
-(void)CreateScrollView4
{
    imagebg4 = [[UIImageView alloc] initWithFrame:CGRectMake(960, 0, 320, 300)];
    
    imagebg4.image = [UIImage imageNamed:@"Snow2.jpg"];
    imagebg4.clipsToBounds = YES;
    [ScrollView1 addSubview:imagebg4];
    for (int a = 1; a < 300 ; a++)
    {
        
        imageview3_1 = [[UIImageView alloc] initWithFrame:CGRectMake(-50+arc4random()%370, -40,30,30)];
        imageview3_1.image = [UIImage imageNamed:@"雪花1.png"];
        
        imageview3_1.tag = 40;//"1"表示可以重用
        [yudimutablearray addObject:imageview3_1];
        [imagebg4 addSubview:imageview3_1];
        
    }
    
}
-(void)Scrollview4animation
{
    //baiyunmutablearray.count
    for (int i = 0; i < yudimutablearray.count; i++)
    {
        UIImageView *yudi_1 = [yudimutablearray objectAtIndex:i];
        if (yudi_1.tag == 40)
        {
            
            [UIView beginAnimations:nil context:(__bridge void *)(yudi_1)];
            [UIView setAnimationDuration:3.0];
            [UIView setAnimationDelegate:self];
            //设置动画结束后的代理
            [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
            
            yudi_1.frame = CGRectMake(-50+arc4random()%370, 250, 20, 20);
            [UIView commitAnimations];
            yudi_1.tag = 41;
            break;
        }
        
        
        
        
    }
    
    
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context

{

    //通过context参数就能得到要传递的snow
    
    UIImageView *baiyun_2 = (__bridge UIImageView *)context;
    

    if (baiyun_2.tag == 2)
    {
        
        baiyun_2.tag = 1;
        baiyun_2.frame = CGRectMake(-100, 50+arc4random()%100, 80, 40);
    }
    else if(baiyun_2.tag == 11)
    {
       
        baiyun_2.tag = 10;
        baiyun_2.frame = CGRectMake(-50+arc4random()%370,-20+arc4random()%30,arc4random()%30, 10);
    }
    else if(baiyun_2.tag == 41)
    {
        
        baiyun_2.tag = 40;
        baiyun_2.frame = CGRectMake(-50+arc4random()%370,-40,30, 30);
    }
    
    
    
    
    
    
    
    
    
    
    
    
}




//添加左侧按钮
-(void)createleft
{
    
    //添加标题左侧按钮
    bttitleleft1 = [[UIButton alloc] initWithFrame:CGRectMake(10,30, 30, 30)];
    bttitleleft1.backgroundColor = [UIColor clearColor];
    UIImageView *imageview0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 15, 15)];
    imageview0.image = [UIImage imageNamed:@"back@2x.png"];
    [bttitleleft1 addTarget:self action:@selector(bitbuttonleft) forControlEvents:UIControlEventTouchUpInside];
    [bttitleleft1 addSubview:imageview0];
    [self.view addSubview:bttitleleft1];
}
//添加左侧按钮
-(void)createright
{
    
    //添加标题左侧按钮
    bttitleright = [[UIButton alloc] initWithFrame:CGRectMake(260,20, 50, 30)];
    bttitleright.backgroundColor = [UIColor clearColor];
    [bttitleright setTitle:@"晚上" forState:UIControlStateNormal];
    [bttitleright addTarget:self action:@selector(bitbuttonRight:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bttitleright];
}

-(void)CreatePagecontrll
{
    pagecontrol =[[UIPageControl alloc] initWithFrame:CGRectMake(10, 270, 100, 5)];
    pagecontrol.numberOfPages = 4;
    [pagecontrol addTarget:self action:@selector(setmove:) forControlEvents:UIControlEventValueChanged];
    pagecontrol.tintColor = [UIColor whiteColor];
    pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];
    pagecontrol.pageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:pagecontrol];
    
    
}
//创建Pagecontrll上面的label标签

-(void)Createlabel
{
    label = [[UILabel alloc] initWithFrame:CGRectMake(5, 220,100, 40)];
    label.text = @"郑州";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
}
-(void)CreateTianqibt
{
    tianqibt = [[UIButton alloc] initWithFrame:CGRectMake(200, 250, 100, 50)];
    [tianqibt setTitle:@"中国天气网" forState:UIControlStateNormal];
    tianqibt.titleLabel.font = [UIFont systemFontOfSize:16];
    [tianqibt addTarget:self action:@selector(bittianqi) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tianqibt];
}

-(void)bittianqi
{
    Wangluolianjie *lianjie = [[Wangluolianjie alloc] init];
    [self presentViewController:lianjie animated:YES completion:nil];
    



}

-(void)CreateTableView
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 300, 320, 140)];
    tableview.rowHeight = 50;
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor clearColor];
    //设置单元格分隔线
    tableview.separatorColor = [UIColor blackColor];
    //设置内部内容偏移量
    //tableview.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    tableview.showsVerticalScrollIndicator = NO;
    tableview.bounces = NO;
    //tableview.backgroundColor =[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [self.view addSubview:tableview];
    tablemutablearray = [[NSMutableArray alloc] initWithObjects:
                    @"10月11日          ☀️晴 11~24度",
                    @"10月12日          ⛅️多云 11~24度",
                    @"10月13日          ☔️小雨 11~24度",
                    @"10月14日          ❄️下雪 11~24度",
                    @"10月15日          ⚡️阵雨 11~24度",
                    nil];
    
    
    
    
    
}

-(void)CreateDiceng
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"添加城市", @"趋势",@"指数",nil];
    for (int j = 0; j<3; j++)
    {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 75, 50)];
        
        // button.backgroundColor = [UIColor redColor];
        button.center = CGPointMake(20*(j+1)+75*j+60, 455);
        NSString *str = [array objectAtIndex:j];
       // [button setBackgroundImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
        button.tag = j + 1;
        [button setTitle:str forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(dicengbitbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cell =@"11";
    UITableViewCell *cellview = [tableView dequeueReusableCellWithIdentifier:cell];
    if (!cellview)
    {
        cellview = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
    cellview.textLabel.text = [tablemutablearray objectAtIndex:indexPath.row];
    cellview.backgroundColor = [UIColor whiteColor];
    return cellview;
    
    
    
}
#pragma mark 左侧按钮绑定的方法
-(void)bitbuttonleft
{
    FirstViewController *first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:nil];
    
}
#pragma mark 右侧按钮绑定的方法
-(void)bitbuttonRight:(UIButton *)tempRight
{
    
    [self panduanCurrentSV];

    if (isbitRight == 0)
    {
        isbitRight = 1;
        [tempRight setTitle:@"白天" forState:UIControlStateNormal];
        NSLog(@"currentSV.tag是_______%d",currentSV.tag);
        switch (currentSV.tag)
        {
                
            case 0:
            {
                UIImageView *SV_1_Day = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
                SV_1_Day.image = [UIImage imageNamed:@"weather4.png"];
                [ScrollView1 addSubview:SV_1_Day];
                
                
            }
                break;
        }
    }
    else
    {
        isbitRight = 0;
        [tempRight setTitle:@"黑夜" forState:UIControlStateNormal];
        
        switch (currentSV.tag)
        {
                
            case 0:
            {
                UIImageView *SV_1_Day = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
                SV_1_Day.image = [UIImage imageNamed:@"weather1.png"];
                [ScrollView1 addSubview:SV_1_Day];
                [self Scrollview1animation];
                //[self.view addSubview:bttitleleft1];
                
            }
           
                break;
            case 1:
            {
//                UIImageView *SV_1_Day = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 300)];
//                SV_1_Day.image = [UIImage imageNamed:@"NightCity1.jpg"];
//                [ScrollView1 addSubview:SV_1_Day];
             
                
                
            }
                break;
                
            case 2:
            {
                
            }
                break;
                
            case 3:
            {
                
            }
                break;
                

                
            default:
                break;
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
-(void)setmove:(UIPageControl *)page
{
   
    int currentpage = page.currentPage;
    [ScrollView1 setContentOffset:CGPointMake(currentpage*320, 0) animated:YES];
 
    
    
    
}
#pragma mark 判断到第几个视图上
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    currentSV = scrollView;
    
    
    
    numpage = currentSV.contentOffset.x/320;
    
    currentSV.tag = numpage ;
    
    
    pagecontrol.currentPage =numpage;
    NSLog(@"currentSV.tag是____%d", currentSV.tag);
    [self panduanCurrentSV];
    
    
    
    
    
}
-(void)panduanCurrentSV
{
    switch (currentSV.tag)
    {
        case 0:
            //[self yemian1donghua];
        {
            label.text = @"郑州";}
            break;
        case 1:
        {
            
            label.text = @"商丘";
            
        }
            break;
            
        case 2:
            
        {
            label.text = @"平顶山";
        }
            break;
            
        case 3:
            
            label.text = @"信阳";
            
            break;
            
            
        default:
            break;
    }

    
}


#pragma mark 底层按钮绑定的方法
-(void)dicengbitbutton:(UIButton *)bit
{
    switch (bit.tag)
    {
        case 1:
        {
            PickerVIewVC *picker = [[PickerVIewVC alloc] init];
            [self presentViewController:picker animated:YES completion:nil];
            
            
            
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

#pragma mark 创建一个UIPickerVIew,用来添加城市
-(void)CreateUIPickerView
{
        
    
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
