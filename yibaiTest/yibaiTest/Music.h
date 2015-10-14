//
//  Music.h
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface Music : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *bttitleleft1;//创建左侧的按钮
    UIButton *bttitleright1;//创建左侧的按钮
    UILabel *TiltleLabel;//创建界面上面的标签
    NSString *filedstr;//播放歌曲的名字
    
    UISlider *slider;
    UISlider *SliderPrograss;
    UIProgressView *myprogress;
    NSTimer *timer;
    UIImageView *imageview;
    UIImageView *bkimageview;
    
    
    
    
    
    
    float jiaodu;
    BOOL PlayORPause;    //控制计时器暂停和继续
    BOOL ISTimer;//控制计时器是否有效
    BOOL ISBitRight;//判断控制音量的按钮是否被点击
    BOOL ISSelectMusic_View;//判断用来显示歌曲名字的UIview是否被打开
    
    
    //创建一个UIView,用来显示底层创建的按钮
    UIView *LowerbtView;
    UIButton *buttonPlay;//控制音乐和进度条播放和暂停的按钮
    UIButton *Backbutton;//创建返回上一首的按钮
    UIButton *Nextbutton;//创建进入下一首的按钮
    
    
    
    
    NSArray *array;//创建一个数组,用来存放下方按钮的名称
    
    AVAudioPlayer *player;
    
    
    
    
    
    //用来粘贴UITableview的视图
    UIView *view;

    UITableView *tableview;// 创建一个UITableview,用来选歌
    
    
    
    
    NSMutableArray *Musicmutable;

    
    

}

@end
