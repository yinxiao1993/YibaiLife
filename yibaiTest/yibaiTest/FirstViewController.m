//
//  FirstViewController.m
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "FirstViewController.h"
#import "Lishibutton.h"
#import "Music.h"
#import "Sweater.h"
#import "New.h"
#import "City.h"
#import "Find.h"
#import "PasswordViewController.h"
#import "ViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

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
    
    
   // UIBarButtonItem *Left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(bitbutton)];
    
    // FindNavig.navigationItem.leftBarButtonItem = Left;
    
    
    
    
    
    
    
    
    
    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];

    imageview.image = [UIImage imageNamed:@"bg2.jpg"];
    [self.view addSubview:imageview];
    [self creatbutton];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, 60, 30)];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(bitbutton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}
-(void)bitbutton
{
    //PasswordViewController *password = [[PasswordViewController alloc] init];
    ViewController *view = [[ViewController alloc] init];
    [self presentViewController:view animated:YES completion:nil];
    


}
-(void)creatbutton
{
    /*中间光环的按钮
    UIButton *centerbt = [[Lishibutton alloc] init];
    centerbt.frame = CGRectMake(160, 110, 220, 220);
    centerbt.backgroundColor = [UIColor clearColor];
    centerbt.center = CGPointMake(160, 240);
    centerbt.layer.masksToBounds = YES ;
    centerbt.layer.cornerRadius = 110;
    centerbt.layer.borderColor = [[UIColor whiteColor]CGColor];
    centerbt.layer.borderWidth = 20;
    centerbt.alpha = 0.6;
    [self.view addSubview:centerbt];
     */
    array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0 ; i < 5; i++)
    {
        //创建五个按钮,并设置成圆形,距离顶端140 围绕中心位置(160,240)旋转,半径是30
        Lishibutton *lishibt = [[Lishibutton alloc] init];
        lishibt.frame = CGRectMake(160, 120, 60, 60);
        lishibt.backgroundColor = [UIColor redColor];
        lishibt.center = CGPointMake(160, 140);
        lishibt.layer.masksToBounds = YES ;
        lishibt.layer.cornerRadius = 20;
        lishibt.layer.borderColor = [[UIColor whiteColor]CGColor];
        lishibt.layer.borderWidth = 1;
        x = 160+100*cos((72*i+54)*M_PI/180);
        y = 240+100*sin((72*i+54)*M_PI/180);
        lishibt.center = CGPointMake(x, y);
        lishibt.angle = 72*i+54;
        [lishibt addTarget:self action:@selector(bitbutton:) forControlEvents:UIControlEventTouchUpInside];
       // NSString *str = [NSString stringWithFormat:@"%d",lishibt.angle];
       // [lishibt setTitle:str forState:UIControlStateNormal];
        lishibt.alpha = 0.9;
        
        [array addObject:lishibt];
        [self.view addSubview:lishibt];
        switch (i)
        {
                
            case 0:
                [lishibt setBackgroundImage:[UIImage imageNamed:@"Copy1副本.jpg"] forState:UIControlStateNormal];
                [lishibt setTitle:@"音乐" forState:UIControlStateNormal];
                lishibt.tag = 1;
          
                break;
            case 1:
              [lishibt setBackgroundImage:[UIImage imageNamed:@"m_item1.png"] forState:UIControlStateNormal];
                lishibt.tag = 2;
            
                break;
            case 2:
           
                [lishibt setBackgroundImage:[UIImage imageNamed:@"m_item3.png"] forState:UIControlStateNormal];
                lishibt.tag = 3;
                
                break;
            case 3:
                
              [lishibt setBackgroundImage:[UIImage imageNamed:@"m_item2.png"] forState:UIControlStateNormal];
                lishibt.tag = 4;
                
                break;
               case 4:
               
                [lishibt setBackgroundImage:[UIImage imageNamed:@"m_item4.png"] forState:UIControlStateNormal];
                lishibt.tag = 0;
            break;

            default:
                break;
        }
        
    }
    
}

-(void)bitbutton:(Lishibutton *)lishibt1
{
  
    if (lishibt1.angle%360 -270 == 270)
    {
        NSLog(@"--11");

        return;
    }
    else
    {
       
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(zhuandong:) userInfo:lishibt1 repeats:YES];
        
    }
}

-(void)zhuandong:(NSTimer *)timer1
{
    
    Lishibutton *dianjibt = (Lishibutton *)timer1.userInfo; //得到点击的按钮
    //让临时按钮动起来
    for (int i = 0; i<array.count; i++)
    {
        Lishibutton *lishibtn = [array objectAtIndex:i];
        lishibtn.angle = lishibtn.angle + 2;
        float lishix = 160+100*cos(lishibtn.angle*M_PI/180);
        float lishiy = 240+100*sin(lishibtn.angle*M_PI/180);
        lishibtn.center = CGPointMake(lishix, lishiy);
        
        if (dianjibt.angle%360 == 270)
        {
            
            [timer1 invalidate];
            timer1 = nil;
            
                Music *musicview = [[Music alloc] init];
                Sweater *sweater = [[Sweater alloc] init];
                New *new = [[New alloc] init];
                City *city = [[City alloc] init];
                Find *find = [[Find alloc] init];
                NSLog(@"%d",dianjibt.tag);
                switch (dianjibt.tag)
                {
                    case 0:
                    {
                       
                        [self presentViewController:new animated:YES completion:nil];
                    }
                        break;
                    case 1:
                    {
                     
                        [self presentViewController:musicview animated:YES completion:nil];
                    }
                        break;
                    case 2:
                    {
                        
                        [self presentViewController:sweater animated:YES completion:nil];
                    }
                        break;
                    case 3:
                    {
                        
                      [self presentViewController:city animated:YES completion:nil];
                    }
                        break;
                    case 4:
                    {
                       
                        [self presentViewController:find animated:YES completion:nil];
                    }
                        break;
                        
                    default:
                        break;
                }
            
        }

    }
    
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
