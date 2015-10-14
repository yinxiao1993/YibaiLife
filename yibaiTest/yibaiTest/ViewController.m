//
//  ViewController.m
//  9ge
//
//  Created by mac on 15-9-25.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    [self createTouchID];
    [self createmimaButton];
    [self createButton];
    [self createjinjibutton];
    [self createquxiaobutton];
    
    count =0 ;
    num = 0;
   
    
    

    
    
}








//创建标签:"Touch ID 或输入密码",距离顶端30 ,左端60,宽200,高30
#pragma mark 创建标签:Touch ID 或输入密码
-(void)createTouchID
{
    label = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Touch ID 或输入密码";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    

    
}
#pragma mark 创建密码提示的按钮
//距离上端80, 左端90,间距20,大小是20
-(void)createmimaButton
/*{
//    int mimax;
//    
//    for (mimax = 0; mimax < 4; mimax++)
//    {
//
//       mimabutton =[[UIButton alloc] initWithFrame:CGRectMake(120, 60, 10, 10)];
//       mimabutton.backgroundColor = [UIColor clearColor];
//       mimabutton.layer.masksToBounds = YES ;
//       mimabutton.layer.cornerRadius = 5;
//       mimabutton.layer.borderWidth = 1;
//       mimabutton.layer.borderColor = [[UIColor whiteColor] CGColor];
//       mimabutton.center = CGPointMake(90+5+20*(mimax+1)+10*mimax,80);
//       [mimabutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        mimabutton.tag = arc4random()%10;
//        NSLog(@"mima%d:%d",mimax,mimabutton.tag);
//        str1 = [NSString stringWithFormat:@"%d",mimabutton.tag];
//        
//        
//      // array = [[NSArray alloc] initWithObjects:str,mimabutton.tag, nil];
//       [self.view addSubview:mimabutton];
//     
//    }
//    NSLog(@"%@",str1);

}*/
{
    
    
    //创建一个mimaview  用来存放密码的四个按钮
    mimaview = [[UIView alloc] initWithFrame:CGRectMake(110, 80, 100, 20)];
    mimaview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mimaview];
    //密码按钮1
    mima0 =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    mima0.backgroundColor = [UIColor clearColor];
    mima0.layer.masksToBounds = YES ;
    mima0.layer.cornerRadius = 5;
    mima0.layer.borderWidth = 1;
    mima0.layer.borderColor = [[UIColor whiteColor] CGColor];
    mima0.center = CGPointMake(5,5);
    mima0.tag = arc4random()%10;
    [mimaview addSubview:mima0];
       //密码按钮2
    mima1 =[[UIButton alloc] initWithFrame:CGRectMake(145, 80, 10, 10)];
    mima1.backgroundColor = [UIColor clearColor];
    mima1.layer.masksToBounds = YES ;
    mima1.layer.cornerRadius = 5;
    mima1.layer.borderWidth = 1;
    mima1.layer.borderColor = [[UIColor whiteColor] CGColor];
    mima1.center = CGPointMake(35,5);
    mima1.tag = arc4random()%10;
    [mimaview addSubview:mima1];
       //密码按钮3
    mima2 =[[UIButton alloc] initWithFrame:CGRectMake(175, 80, 10, 10)];
    mima2.backgroundColor = [UIColor clearColor];
    mima2.layer.masksToBounds = YES ;
    mima2.layer.cornerRadius = 5;
    mima2.layer.borderWidth = 1;
    mima2.layer.borderColor = [[UIColor whiteColor] CGColor];
    mima2.center = CGPointMake(65,5);
    mima2.tag = arc4random()%10;
    [mimaview addSubview:mima2];
    
    //密码按钮4
    mima3 =[[UIButton alloc] initWithFrame:CGRectMake(205, 80, 10, 10)];
    mima3.backgroundColor = [UIColor clearColor];
    mima3.layer.masksToBounds = YES ;
    mima3.layer.cornerRadius = 5;
    mima3.layer.borderWidth = 1;
    mima3.layer.borderColor = [[UIColor whiteColor] CGColor];
    mima3.center = CGPointMake(95,5);
    mima3.tag = arc4random()%10;
    [mimaview addSubview:mima3];
    NSLog(@"%d",mima0.tag);
    NSLog(@"%d",mima1.tag);
    NSLog(@"%d",mima2.tag);
    NSLog(@"%d",mima3.tag);
    
    
    
    
    
    
    
    
}
#pragma mark 创建屏幕上0-9的按钮
//距离顶端是140,左端是35,大小是60 上下间距25 左右间距35
-(void)createButton
{
    /*按钮起始距离顶端上标是140
     ..........左边......35
     每个键的大小半径是30
     左右距离35
     上下距离25
     */
    
    for (y = 0; y < 4; y++)
    {
        
        for (x = 0; x< 3; x++)
        {
            button =[[UIButton alloc] initWithFrame:CGRectMake(30, 60, 60, 60)];
            button.backgroundColor = [UIColor clearColor];
            button.layer.masksToBounds = YES ;
            button.layer.cornerRadius = 30;
            button.layer.borderWidth = 3;
            button.layer.borderColor = [[UIColor whiteColor] CGColor];
            button.center = CGPointMake(35*(x+1)+60*x+30,140+25*(y+1)+60*y);
            str = [NSString stringWithFormat:@"%d",y * 3 + x + 1];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitle:str forState:UIControlStateNormal];
            [button addTarget:self action:@selector(bitbutton:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:35];
            [self.view addSubview:button];
            a =[str intValue];
            button.tag = a;  //后期会用tag值做比较
          //  NSLog(@"%d",a);
            switch (a)
            {
                case 10:
                    [button removeFromSuperview];
                    [self createjinjibutton];
                    break;
                case 11:
                    [button setTitle:@"0" forState:UIControlStateNormal];
                    button.tag = 0 ;
                    break;
                case 12:
                    [button removeFromSuperview];
                    
                    break;
                default:
                    break;
            }
        }
        
    }
    
}
-(void)bitbutton:(UIButton *)linshibutton
{
  
   // NSLog(@"%d",linshibutton.tag);

    dianjicishi = dianjicishi + 1;
    
    switch (dianjicishi)
    {
        case 1:
        {
           
            mima0.backgroundColor = [UIColor whiteColor];
            if ( linshibutton.tag == mima0.tag)
            {
                
                
                count++;
                
            }
        }
            break;
            
        case 2:
        {
           
            mima1.backgroundColor = [UIColor whiteColor];
            if ( linshibutton.tag == mima1.tag)
            {
                
                
                count++;
                
            }
        }
            break;

        case 3:
        {
            
            mima2.backgroundColor = [UIColor whiteColor];
            if ( linshibutton.tag == mima2.tag)
            {
                
                
                count++;
                
            }
        }
            break;

        case 4:
        {
           
            mima3.backgroundColor = [UIColor whiteColor];
            if ( linshibutton.tag == mima3.tag)
            {
                
                
                count++;
               
                
            }
        }
             [self jumpNext];
            break;

            
        default:
            break;
    }

    
    
    
    
}
//如果密码正确,进入下一界面
-(void)jumpNext
{
    if (count == 4)
    {
        FirstViewController *first = [[FirstViewController alloc] init];
        [self presentViewController:first animated:YES completion:nil];

    }
    else
    {
        if (num < 5)
        {
            [self left];
            num ++;
            

        }
        else
        {
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码错误" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"关闭", nil];
            [alter show];
            
        }
       // [self left];
        
        
        
        
        
        
    }
    

    
    
    


}
-(void)left
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.05];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatCount:3];
    [UIView setAnimationDidStopSelector:@selector(return1)];
    mimaview.center = CGPointMake(130, 90);
    //移动mimaview的坐标
    mimaview.center = CGPointMake(190, 90);
    dianjicishi =0;
    mima0.backgroundColor = [UIColor clearColor];
    mima1.backgroundColor = [UIColor clearColor];
    mima2.backgroundColor = [UIColor clearColor];
    mima3.backgroundColor = [UIColor clearColor];
    [UIView commitAnimations];
    
}
-(void)return1
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.05];
    [UIView setAnimationDelegate:self];
    mimaview.center = CGPointMake(160, 90);    
    [UIView commitAnimations];
    

}



#pragma mark 创建紧急按钮
-(void)createjinjibutton
{
    
    jinjibutton =[[UIButton alloc] initWithFrame:CGRectMake(20, 395, 100, 60)];
    jinjibutton.backgroundColor = [UIColor clearColor];
    [jinjibutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [jinjibutton setTitle:@"紧急情况" forState:UIControlStateNormal];
    [self.view addSubview:jinjibutton];

}
#pragma mark 创建取消按钮
-(void)createquxiaobutton
{
    quxiaobutton =[[UIButton alloc] initWithFrame:CGRectMake(225,395,60,60)];
    quxiaobutton.backgroundColor = [UIColor clearColor];
    [quxiaobutton setTitle:@"取消" forState:UIControlStateNormal];
    [quxiaobutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [quxiaobutton addTarget:self action:@selector(quxiaobit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quxiaobutton];


}
-(void)quxiaobit:(UIButton *)quxiaobt
{
    //NSLog(@"qq");
  
    switch (dianjicishi)
    {
        case 0:
            count = 0;
            break;
        case 1:
            
            mima0.backgroundColor = [UIColor clearColor];
            count --;
            break;
        case 2:
            mima1.backgroundColor = [UIColor clearColor];
            count --;
            break;
        case 3:
            mima2.backgroundColor = [UIColor clearColor];
            count --;
            break;
        case 4:
            mima3.backgroundColor = [UIColor clearColor];
            count --;
            break;
        default:
            break;
    }
    
    
      dianjicishi = dianjicishi - 1;
    
    
    
    
    
    
}
-(void)cuowutishi
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
