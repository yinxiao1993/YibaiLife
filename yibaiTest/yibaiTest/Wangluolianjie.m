//
//  Wangluolianjie.m
//  yibaiTest
//
//  Created by mac on 15-10-11.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "Wangluolianjie.h"
#import "Sweater.h"
@interface Wangluolianjie ()

@end

@implementation Wangluolianjie

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
    [self CreateTitle];
    [self CreateLianjie];
    
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

-(void)CreateLianjie
{
    
    
    tianqiwang = [[UIWebView alloc] initWithFrame:CGRectMake(0, 70, 320,480)];
    tianqiwang .delegate = self ;
    tianqiwang .scrollView.bounces = NO ;
    
    
    
    [self.view addSubview:tianqiwang ];
    
    
    NSURLRequest *url = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.weather.com.cn"]];
    [tianqiwang loadRequest:url];
    
    //创建一个风火轮
    activi = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(130, 240, 60, 60)];
    activi.color = [UIColor redColor];
    [self.view addSubview:activi];
    
    
    
}
-(void)bitbutton
{
    Sweater *sweater = [[Sweater alloc]init];
    [self presentViewController:sweater animated:YES completion:nil];
    
    
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    [activi startAnimating];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activi stopAnimating];
    
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
