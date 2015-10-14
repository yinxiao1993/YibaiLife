//
//  PasswordViewController.m
//  yibaiTest
//
//  Created by mac on 15-9-29.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "PasswordViewController.h"
#import "FirstViewController.h"
#import "ViewController.h"
@interface PasswordViewController ()

@end

@implementation PasswordViewController

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
    
    self.view.backgroundColor = [UIColor cyanColor];
    bkimageview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    bkimageview.image =[UIImage imageNamed:@"Copy1副本.jpg"];
    [self.view addSubview:bkimageview];
    
    [self createPassword];
    qiushu = qiushu +1;
    
    
}
-(void)createPassword
{
    
    nummutable = [[NSMutableArray alloc] initWithCapacity:0];
    for (int num = 0; num < 10; num ++)
    {
        NSString *strnum = [NSString stringWithFormat:@"%d",arc4random()%10];
        [nummutable addObject:strnum];
        // NSLog(@"%@",strnum);
    }
    /*按钮起始距离顶端上标是175
     ..........左边......24
     每个键的大小半径是25
     左右距离24
     
     */
    for (x1 = 0; x1 < 4; x1++)
    {
        button1 = [[UIButton alloc] initWithFrame:CGRectMake(24, 170, 50, 50)];
        button1.backgroundColor = [UIColor clearColor];
        button1.layer.masksToBounds = YES ;
        button1.layer.cornerRadius = 30;
        button1.layer.borderWidth = 4;
        button1.layer.borderColor = [[UIColor whiteColor] CGColor];
        button1.center = CGPointMake(24*(x1+1)+50*x1+24,175);
        int random = arc4random()%nummutable.count;
        str = nummutable[random];
        button1.tag = [str intValue];
        [button1 setTitle:str forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self.view addSubview:button1];
        [nummutable removeObject:str];
        NSLog(@"%d",button1.tag);
        switch (x1)
        {
            case 0:
                lishitag1 =button1.tag;
                break;
            case 1:
                lishitag2 =button1.tag;
                break;
                
            case 2:
                lishitag3 =button1.tag;
                break;
                
            case 3:
                lishitag4 =button1.tag;
                break;
                
                
            default:
                break;
        }
    }
    
    for (y = 0; y < 2; y++)
    {
        for (x = 0; x< 5; x++)
        {
            muarray = [[NSMutableArray alloc]initWithCapacity:0];
            
            //下面的按钮距离顶端是300 大小30*30 左右距离20
            button2 =[[UIButton alloc] initWithFrame:CGRectMake(30, 60, 40, 40)];
            button2.backgroundColor = [UIColor redColor];
            button2.layer.masksToBounds = YES ;
            button2.layer.cornerRadius = 30;
            button2.layer.borderWidth = 4;
            button2.layer.borderColor = [[UIColor cyanColor] CGColor];
            button2.center = CGPointMake(25*(x+1)+40*x+5,300+25*(y+1)+40*y);
            str = [NSString stringWithFormat:@"%d",y * 5 + x ];
            
            [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button2 setTitle:str forState:UIControlStateNormal];
            [muarray addObject:str];
            [button2 addTarget:self action:@selector(bitbutton:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button2];
            a =[str intValue];
            button2.tag = a;//后期会用tag值做比较
            
        }
        
    }
    
    
}

-(void)bitbutton:(UIButton *)clikebit
{
    // NSLog(@"%d",clikebit.tag);
    // NSLog(@"%d",)
    NSLog(@"%d",lishitag1);
    NSLog(@"%d",lishitag2);
    NSLog(@"%d",lishitag3);
    NSLog(@"%d",lishitag4);
    //设置球被点击的次数
    switch (qiushu)
    {
        case 1:
        {
            if (clikebit.tag == lishitag1)
            {
                
                count++;  //密码正确的次数
                
            }
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1.0];
            clikebit.center = CGPointMake(24*(0+1)+50*0+24,175);
            [UIView commitAnimations];
            qiushu++;
            linshitag1 = clikebit.tag;  //标记此按钮已经上去过了,并且不能在上面移动
            NSLog(@"%d",count);
        }
            break;
        case 2:
        {
            
            if (clikebit.tag == lishitag2 )
            {
                count++;
            }
            
            if (clikebit.tag != linshitag1)
            {
                
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                clikebit.center = CGPointMake(24*(1+1)+50*1+24,175);
                [UIView commitAnimations];
                qiushu++;
                linshitag2=clikebit.tag;
                
                
                
                
            }
            NSLog(@"%d",count);
            
        }
            break;
        case 3:
        {
            
            if (clikebit.tag == lishitag3)
            {
                count++;
            }
            
            if (clikebit.tag != linshitag2 && clikebit.tag != linshitag1 )
            {
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                clikebit.center = CGPointMake(24*(2+1)+50*2+24,175);
                [UIView commitAnimations];
                linshitag3=clikebit.tag;
                qiushu++;
            }
            NSLog(@"%d",count);
        }
            break;
        case 4:
        {
            
            if (clikebit.tag != linshitag3 && clikebit.tag != linshitag2 && clikebit.tag != linshitag1)
            {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                clikebit.center = CGPointMake(24*(3+1)+50*3+24,175);
                [UIView commitAnimations];
                
                
            }
            if (clikebit.tag == lishitag4)
            {
                
                count++;
                NSLog(@"%d",count);
                
            }
            
            NSLog(@"%d",count);
            [self jump];
            
        }
            
            break;
            
        default:
            break;
    }
    
    
}
-(void)jump
{
    NSLog(@"%d",count);
    if (count == 4)
    {
//        // PasswordViewController *pass = [[PasswordViewController alloc] init];
//        FirstViewController *first = [[FirstViewController alloc] init];
//        [self presentViewController:first animated:YES completion:nil];
        //[pass removeFromParentViewController];
        
        ViewController *viewVC = [[ViewController alloc] init];
        
       [self presentViewController:viewVC animated:YES completion:nil];
        
        
        
        
        
        
        
    }
    else
    {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码错误" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"关闭", nil];
        [alter show];
        
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
