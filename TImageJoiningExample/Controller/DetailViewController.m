//
//  DetailViewController.m
//  TImageJoiningExample
//
//  Created by Jeavil_Tang on 2016/11/2.
//  Copyright © 2016年 Jeavil. All rights reserved.
//

#import "DetailViewController.h"
#import "ShareImageView.h"


@interface DetailViewController ()
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) UIImageView *photoImageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setUpDataSource];
    [self setUpUserInterface];
}

- (void)setUpUserInterface {
    _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth, ScreenHeight - 40)];
    _photoImageView.center = self.view.center;
    [self.view addSubview:_photoImageView];
    
    __weak __typeof(&*self) weakSelf = self;
    ShareImageView *view = [[ShareImageView alloc] init];
    [view bindData:_imageArray completion:^(UIImage *image) {
        // 此处如果需要即时将拼接好的image显示出来，则给当前的imageview设置image
        weakSelf.photoImageView.image = image;
        weakSelf.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        weakSelf.photoImageView.clipsToBounds = YES;

        
/* 如果不需要即时显示出来，而是分享到社交平台后显示拼接的图片，可以将image先存在文件中，需要的时候再取出来
        
    -- 存图 --
       NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
       NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",[[NSUUID UUID] UUIDString]]];
       [UIImagePNGRepresentation(image) writeToFile:filePath atomically:NO];
        
    -- 取图 --
       UIImage *image = [UIImage imageWithContentsOfFile:filePath]; 
 */
    }]; 
}

- (void)setUpDataSource {
    self.imageArray = @[@"photo1",@"photo2",@"photo3",@"photo4",@"photo5",@"photo6"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
