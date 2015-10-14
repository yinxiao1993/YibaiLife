//
//  Music.m
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "Music.h"
#import "FirstViewController.h"
@interface Music ()

@end

@implementation Music

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
    self.view.backgroundColor = [UIColor whiteColor];

    [self createJiemian];
    [self CreateTitleLabel];

    //[self createSlider];
    [self createleft];
    [self createRight];
    filedstr = @"你是我的眼";
    NSString *filed = [[NSBundle mainBundle]pathForResource:filedstr ofType:@"mp3" ];
    NSURL *filedUrl = [[NSURL alloc]initFileURLWithPath:filed];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:filedUrl error:nil];
    [player prepareToPlay];//播放之前加载一下
    [player play];
    
    
    
    array = [[NSArray alloc] initWithObjects:@"上一首",@"播放",@"下一首",@"选歌", nil];
    [self CreateTableView_SelectMusic];
    [self CreatePlayerAndPause];
    
    [self CreateProgress];
    //利用定时器旋转图片
  
    PlayORPause = YES;//控制计时器暂停和继续
    ISTimer = NO;//控制计时器是否有效
    ISBitRight = NO;//判断控制音量的按钮是否被点击
    ISSelectMusic_View = NO;//判断用来显示歌曲名字的UIview是否被打开
   
    Musicmutable = [[NSMutableArray alloc] initWithObjects:
                     @"01  你是我的眼",
                     @"02  北京的金山上",
                     @"03  新娘不是我",
                     @"04  天后",
                     @"05  不离开",
                     @"06  独家记忆",
                     @"07  不要说话",
                    
                    nil];

}
#pragma mark 创建左侧的按钮
-(void)createleft
{
    
    
    //添加标题左侧按钮
    bttitleleft1 = [[UIButton alloc] initWithFrame:CGRectMake(10,30, 30, 30)];

    UIImageView *imageview0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 15, 15)];
    imageview0.image = [UIImage imageNamed:@"back@2x.png"];
    [bttitleleft1 addTarget:self action:@selector(bitbuttonleft) forControlEvents:UIControlEventTouchUpInside];
    [bttitleleft1 addSubview:imageview0];
    [self.view addSubview:bttitleleft1];
}
#pragma mark 创建右侧的音量
-(void)createRight
{
    
    
    //添加标题右侧按钮
    bttitleright1 = [[UIButton alloc] initWithFrame:CGRectMake(270,20, 50, 30)];
    
    [bttitleright1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bttitleright1 setTitle:@"音量" forState:UIControlStateNormal];
    [bttitleright1 addTarget:self action:@selector(bitbuttonright1) forControlEvents:UIControlEventTouchUpInside];
  
    [self.view addSubview:bttitleright1];
}
#pragma mark 创建主界面上面的标签
-(void)CreateTitleLabel
{
    TiltleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 30)];
    TiltleLabel.textColor = [UIColor blackColor];
    TiltleLabel.text = filedstr;
    TiltleLabel.text = @"你是我的眼";
    TiltleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:TiltleLabel];
    
}
#pragma mark 创建主界面
-(void)createJiemian
{
    
    bkimageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    bkimageview.image = [UIImage imageNamed:@"音乐主界面.jpg"];
    [self.view addSubview:bkimageview];
 
    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(50, 80, 200, 200)];
    imageview.layer.masksToBounds = YES ;
    imageview.layer.cornerRadius = 100;
    imageview.center = CGPointMake(160, 240);
    imageview.image = [UIImage imageNamed:@"02.jpg"];
   // [self.view addSubview:imageview];

}
#pragma mark 创建主界面创建滑杆
-(void)createSlider
{
    slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 40, 200, 60)];
    //设置属性
    //设置滑杆左边的颜色
    slider.minimumTrackTintColor = [UIColor redColor];
    //设置滑杆右边的颜色
    slider.maximumTrackTintColor = [UIColor greenColor];
    //滑杆最大最小值
    slider.minimumValue = 0.0;
    slider.maximumValue = 100.0;
    [slider addTarget:self action:@selector(bitslider:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    
}

#pragma mark 创建主界面进度条
-(void)CreateProgress
{

    myprogress = [[UIProgressView alloc]initWithFrame:CGRectMake(70, 20, 200, 40) ];
    myprogress.progressTintColor = [UIColor redColor];
    myprogress.trackTintColor = [UIColor whiteColor];
    //myprogress.progressViewStyle = UIProgressViewStyleBar;
    [myprogress setProgress:1.0 animated:YES];
    myprogress.progress = 0;
    
   
    [LowerbtView addSubview:myprogress];
    
    
    
    
}

#pragma mark 创建暂停和继续的按钮  以及上一步 \ 下一步 \ 选歌 的按钮
-(void)CreatePlayerAndPause
{
    LowerbtView = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 320, 80)];
    LowerbtView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:LowerbtView];
    
    for (int i = 1; i<5; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        //button.backgroundColor = [UIColor redColor];
        button.center = CGPointMake(70+30+60*(i - 1), 50);
        NSString *str = [array objectAtIndex:i-1];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [button setTitle:str forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(bit_button:)forControlEvents:UIControlEventTouchUpInside];
        [LowerbtView addSubview:button];
    }
    
}
#pragma mark 创建一个UITableview,用来选歌
-(void)CreateTableView_SelectMusic
{
    //用来粘贴UITableview的视图
   // view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 320, 480*2)];

    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *labletitleView = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 30)];
    labletitleView.text = @"播放队列(5)";
    //tableview.contentInset = UIEdgeInsetsMake(0, -50, 0, 0);
  //  [view addSubview:labletitleView];
    
    
    
    
    
    
    
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320,440+480)];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.bounces = YES;
   // tableview.showsHorizontalScrollIndicator = YES;
   // tableview.showsVerticalScrollIndicator = YES;
    //tableview.pagingEnabled = YES;
    [view addSubview:tableview];
    
    
    
    
}
#pragma mark 图片旋转

-(void)MoveProgress
{
    
    if (myprogress.progress < 1.0)
    {
        myprogress.progress = myprogress.progress + 0.05;
    }
    else
    {
        myprogress.progress = 0;
    }
    
    
}
-(void)bitslider:(UISlider *)tempslider
{
  
}
#pragma mark 创建左侧按钮绑定的方法
-(void)bitbuttonleft
{
    FirstViewController *first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:nil];
    
    
}
#pragma mark 创建右侧控制音量的按钮绑定的方法
-(void)bitbuttonright1
{
    if (ISBitRight == NO)
    {
        ISBitRight = YES;
        [self createSlider];
    }
    else
    {
        ISBitRight = NO;
        [slider removeFromSuperview];
    }
    
}
-(void)bit_button:(UIButton *)tempbit
{
    
    switch (tempbit.tag)
    {
        case 1:
        {
            
            
        }
            
            break;
        case 2:
        {
            
            if (PlayORPause == YES)
            {
                if (ISTimer == NO)
                {
                    ISTimer = YES; //此时定时器正在计时
                    
                    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(MoveProgress) userInfo:nil repeats:YES];
                }
               
                PlayORPause = NO;
                
                [timer setFireDate:[NSDate distantPast]];//停止播放
                [tempbit setTitle:@"暂停" forState:UIControlStateNormal];
                
                NSLog(@"_________%f",myprogress.progress);
                
                [player pause];
                
            }
            else
            {
                
               [timer setFireDate:[NSDate distantFuture]];//开始播放
                [tempbit setTitle:@"播放" forState:UIControlStateNormal];
                PlayORPause = YES;
                [player play];
            }
            
        }
            
            break;
        case 3:
        {
            
            
            
        }
            
            break;
        case 4:
        {
            if (ISSelectMusic_View == NO)
            {
                ISSelectMusic_View = YES;
             
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                view.Frame=CGRectMake(0, 200, 320, 480*2);
                
                [UIView commitAnimations];
                
            }
            else
            {
                ISSelectMusic_View = NO;
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                view.Frame=CGRectMake(0, 400, 320, 480+400);
                
                [UIView commitAnimations];
            }
            
            
        }
            
            break;
            
        default:
            break;
    }
    
    
    
}
#pragma mark UItableView滚动视图自带的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cell = @"11";
    
    UITableViewCell *viewcell = [tableview dequeueReusableCellWithIdentifier:cell];
    if (!viewcell)
    {
        viewcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
        
    }
    
    NSString *str = [Musicmutable objectAtIndex:indexPath.row];
    viewcell.textLabel.text = str;
    return viewcell;
    
    
    
    
    
    
    return viewcell;
    
    
    
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
