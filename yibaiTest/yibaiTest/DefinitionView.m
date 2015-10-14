//
//  DefinitionView.m
//  yibaiTest
//
//  Created by mac on 15-10-11.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "DefinitionView.h"
#import "FirstViewController.h"
@implementation DefinitionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 50)];
        
        //添加标题图片
        imagetitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320,50)];
        imagetitle.backgroundColor = [UIColor redColor];
        imagetitle.image = [UIImage imageNamed:@"commonNavBar@2x.png"];
        [view addSubview:imagetitle];
        
        
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
        [view addSubview:bttitleleft1];
    }
    return self;
}
-(void)bitbutton
{
    FirstViewController *first = [[FirstViewController alloc] init];
    self.window.rootViewController = first;
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
