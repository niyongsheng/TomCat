//
//  ViewController.m
//  汤姆猫
//
//  Created by 倪刚 on 2017/5/3.
//  Copyright © 2017年 倪刚. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 喝牛奶 吃小鸟 敲锣 生气 扔披萨 划屏幕
- (IBAction)drink;
- (IBAction)eat;
- (IBAction)cymbal;
- (IBAction)angry;
- (IBAction)pie;
- (IBAction)scratch;

// 敲头  踩右脚  摸肚子  摸尾巴
- (IBAction)knockHead;
- (IBAction)rightFoot;
- (IBAction)stomach;
- (IBAction)angryTarl;

/** tom猫view控件 */
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -runAnimation
- (void)runAnimation:(int)count name:(NSString *)name time:(CGFloat)time
{
    // 检测现在是否有动画正在进行
    //if(self.tom.isAnimating) return;
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i < count + 1; i++) {
        // 1.加载所有的动画图片
        NSString *filename = [NSString stringWithFormat:@"%@_%02d.jpg",name, i];
        
        // 2.加载图片
        //UIImage *image = [UIImage imageNamed:filename]; // 缓存
        
        // 指向app的主文件夹
        NSBundle *bundle = [NSBundle mainBundle];
        
        // 获得文件全路径
        NSString *path = [bundle pathForResource:filename ofType:nil];
        
        // imageWithContentsOfFile： 没有缓存（传入文件路径）
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        // 3.添加图片到数组中
        [images addObject:image];
    }
    //self.tom.animationImages指向images
    self.tom.animationImages = images;
    
    // 1.播放时长
    self.tom.animationDuration =  images.count * time;
    
    // 2.播放次数
    self.tom.animationRepeatCount = 1;
    
    // 3.开始动画
    [self.tom startAnimating];
    
    // 动画结束后延时1秒调用clearCache清空指向images对象的指针
    CGFloat delay = self.tom.animationDuration + 2.0;
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
}

- (IBAction)drink {
    [self runAnimation:80 name:@"drink" time:0.07];
}

- (IBAction)eat {
    [self runAnimation:39 name:@"eat" time:0.09];
}

- (IBAction)cymbal {
    [self runAnimation:12 name:@"cymbal" time:0.09];
}

- (IBAction)angry {
    [self runAnimation:25 name:@"angry" time:0.1];
}

- (IBAction)pie {
    [self runAnimation:23 name:@"pie" time:0.1];
}

- (IBAction)scratch {
    [self runAnimation:55 name:@"scratch" time:0.12];
}



- (IBAction)knockHead {
    [self runAnimation:80 name:@"knockout" time:0.05];
}

- (IBAction)rightFoot {
    [self runAnimation:29 name:@"footRight" time:0.05];
}

- (IBAction)stomach {
    [self runAnimation:25 name:@"stomach" time:0.05];
}

- (IBAction)angryTarl {
    [self runAnimation:25 name:@"angry" time:0.08];
}

@end

void animation()
{
    //    // 检测现在是否有动画正在进行
    //    if(self.tom.isAnimating) return;
    //
    //    NSMutableArray *images = [NSMutableArray array];
    //
    //    for (int i = 0; i < 81; i++) {
    //        // 1.加载所有的动画图片
    //        NSString *filename = [NSString stringWithFormat:@"drink_%02d.jpg",i];
    //
    //        // 2.加载图片
    //        UIImage *image = [UIImage imageNamed:filename];
    //
    //        // 3.添加图片到数组中
    //        [images addObject:image];
    //    }
    //    self.tom.animationImages = images;
    //
    //    // 1.播放时长
    //    self.tom.animationDuration =  images.count * 0.05;
    //
    //    // 2.播放次数
    //    self.tom.animationRepeatCount = 1;
    //    
    //    // 3.开始动画
    //    [self.tom startAnimating];
}
