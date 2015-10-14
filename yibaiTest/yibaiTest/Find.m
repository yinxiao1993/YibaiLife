//
//  Find.m
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "Find.h"
#import "FirstViewController.h"
@interface Find ()

@end

@implementation Find

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
     [self CreateBaidu];
    [self CreateScrollView];
    [self createview];
    [self CreateTitle];
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
    label.text = @"搜索";
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
-(void)bitbutton
{
    FirstViewController *first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:nil];
    
}
-(void)createview
{
    view = [[UIView alloc]initWithFrame:CGRectMake(20, 38, 50, 2)];
    view.center = CGPointMake(30, 39);
    view.backgroundColor = [UIColor redColor];
    [scrollview addSubview:view];
}

-(void)CreateScrollView
{
    
    
    
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, 320, 40)];
    scrollview.contentSize = CGSizeMake(320*2, 30);
   // scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.bounces = NO;
    scrollview.backgroundColor = [UIColor grayColor];
    scrollview.delegate = self;
   // scrollview.pagingEnabled = YES ;
    [self.view addSubview:scrollview];
    
    Namemutable = [[NSMutableArray alloc] initWithObjects:@"百度",@"智游",@"新闻",@"百科",@"娱乐",@"头条", nil];
    URLmutable = [[NSMutableArray alloc] initWithObjects:@"http://www.baidu.com",@"http://www.zhiyou900.com",@"http://news.sina.com.cn",@"http://baike.baidu.com",@"http://ent.qq.com",@"http://toutiao.com", nil];
    
    for (int i = 0 ; i < 6 ; i ++)
    {
        
        //创建一个宽50 高40 左右距离是60
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 0, 50, 40)];
        button.center = CGPointMake(60*i+40*i+30 , 20);
        button.backgroundColor = [UIColor clearColor];
        button.tag = i ;
        str = [Namemutable objectAtIndex:i];
        [button setTitle:str forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [button addTarget:self action:@selector(bitbutton_1:) forControlEvents:UIControlEventTouchUpInside];
        [self createview];
       
        view.backgroundColor = [UIColor clearColor];
        [scrollview addSubview:button];
       
    }
    

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    [activi startAnimating];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activi stopAnimating];
    
}

-(void)bitbuttonleft
{
    FirstViewController *first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)CreateBaidu
{
    baiduview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)];
    baiduview .delegate = self ;
    baiduview .scrollView.bounces = NO ;
    
  
    
    [self.view addSubview:baiduview ];
    
    
    NSURLRequest *url = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [baiduview loadRequest:url];
    
    //创建一个风火轮
    activi = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(130, 240, 60, 60)];
    activi.color = [UIColor redColor];
    [self.view addSubview:activi];
    
    
}
-(void)bitbutton_1:(UIButton *)tempbt
{
    view.center = CGPointMake(60*tempbt.tag+40*tempbt.tag+30 , 39);
    view.backgroundColor = [UIColor redColor];
    [scrollview addSubview:view];
   
    VC = [[UIWebView alloc] initWithFrame:CGRectMake(0, 110, 320, 480)];
    VC.delegate = self ;
    VC.scrollView.bounces = NO ;
    
    [self.view addSubview:VC];
    
    str = [URLmutable objectAtIndex:tempbt.tag];
    NSURLRequest *url = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:str]];
    [VC loadRequest:url];
    
    //创建一个风火轮
    activi = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(130, 240, 60, 60)];
    activi.color = [UIColor redColor];
    [self.view addSubview:activi];
    
    
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
