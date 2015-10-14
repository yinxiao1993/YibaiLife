//
//  PickerVIewVC.m
//  yibaiTest
//
//  Created by mac on 15-10-13.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "PickerVIewVC.h"
#import "Sweater.h"
@interface PickerVIewVC ()

@end

@implementation PickerVIewVC

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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
   
    [self CreateTitleImage];
    [self CreatePickeViewBg];
    [self CreatePickerView];
    [self createleft];
}
#pragma mark 创建标题的背景图片
-(void)CreateTitleImage
{
    
    
    //添加标题图片
    imagetitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320,50)];
    imagetitle.backgroundColor = [UIColor redColor];
    imagetitle.image = [UIImage imageNamed:@"c_bg@2x.png"];
    [self.view addSubview:imagetitle];
    
}
#pragma mark 创建UIPickerView的背景图片
-(void)CreatePickeViewBg
{
    
    
    //添加标题图片
    imageCityBg = [[UIImageView alloc] initWithFrame:CGRectMake(0,70, 320,250)];
    imageCityBg.backgroundColor = [UIColor redColor];
    imageCityBg.image = [UIImage imageNamed:@"NightCity1.jpg"];
    [self.view addSubview:imageCityBg];
    
    
    
    
}


#pragma mark 创建标题左侧按钮
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
-(void)bitbuttonleft
{
    Sweater *weater = [[Sweater alloc] init];
    [self presentViewController:weater animated:YES completion:nil];
    
}
-(void)CreatePickerView
{
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,300, 320, 150)];
  
    picker.backgroundColor = [UIColor clearColor];
    picker.tintColor = [UIColor redColor];
    
    picker.dataSource = self ;
    
    picker.delegate = self;
    
    [self.view addSubview:picker];
    
    
 
    
    CitySheng = [[NSMutableArray alloc] initWithObjects:@"河南",@"广西",@"辽宁",@"山东",@"江西", nil];
    NSArray *henanshiarray =[[NSArray alloc] initWithObjects:@"商丘", @"信阳",@"南阳",@"驻马店",@"周口",nil];
    NSArray *guangxishiarray =[[NSArray alloc] initWithObjects:@"贵港", @"南宁",@"桂林",nil];
    NSArray *liaoningshiarray =[[NSArray alloc] initWithObjects:@"大连", @"阜阳",@"铁岭",nil];
    NSArray *shandongshiarray =[[NSArray alloc] initWithObjects: @"临沂",@"济南",@"青岛",@"日照",nil];
    NSArray *jiangxishiarray =[[NSArray alloc] initWithObjects:@"抚州", @"景德镇",nil];
    CityShi = [[NSMutableArray alloc] initWithObjects:henanshiarray,guangxishiarray,liaoningshiarray,shandongshiarray,jiangxishiarray,nil];
    CityShengAndshi= [[NSMutableDictionary alloc] initWithObjects:CityShi forKeys:CitySheng];

    
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return CitySheng.count;
    }
    else
    {
        int numRow = [pickerView selectedRowInComponent:0];
        NSString *str = [CitySheng objectAtIndex:numRow];
        NSArray *shiArray = [CityShengAndshi objectForKey:str];
        return shiArray.count;
        
        
        
        
    }
    
    
    
    
    
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   
    
    if (component == 0)
    {
        NSString *CityshengStr = [CitySheng objectAtIndex:row];
        return CityshengStr;
    }
    else
    {
    int Strshengnum = [pickerView selectedRowInComponent:0];
    NSString *Strsheng = [CitySheng objectAtIndex:Strshengnum];
    NSArray *StrArray = [CityShengAndshi objectForKey:Strsheng];
    NSString *Strshi = [StrArray objectAtIndex:row ];
    return Strshi;
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        [picker reloadComponent:1];
    }
    NSString *strtitle_2 = [CitySheng objectAtIndex:[picker selectedRowInComponent:0]];
    NSArray *str = [CityShengAndshi objectForKey:strtitle_2];
    NSString *strshi_2 = [str objectAtIndex:[picker selectedRowInComponent:1]];

    NSLog(@"__%@___%@",strtitle_2,strshi_2);
    
    
    
    
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
