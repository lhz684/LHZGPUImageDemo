//
//  GPUPhotoVC.m
//  LHZGPUImageDemo
//
//  Created by mac on 2019/11/22.
//  Copyright © 2019 mac. All rights reserved.
//

#import "GPUPhotoVC.h"
#import <GPUImage/GPUImageFramework.h>

@interface GPUPhotoVC ()

@property (weak, nonatomic) IBOutlet UIImageView *orginImgView;
@property (weak, nonatomic) IBOutlet UIImageView *gpuImgVIew;

@end

@implementation GPUPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.orginImgView.image = [self originImg];
    
    [self gpuImg];
}

- (UIImage *)originImg {
    UIImage * img = [UIImage imageNamed:@"photo"];
    return img;
}

- (void)gpuImg {
    UIImage * img = [self originImg];
    GPUImagePicture * picture = [[GPUImagePicture alloc] initWithImage:img];
    
    //褐色
    GPUImageSepiaFilter * sepiaFilter = [[GPUImageSepiaFilter alloc] init];
    
    [picture addTarget:sepiaFilter];
    [sepiaFilter useNextFrameForImageCapture];
    [picture processImage];
    
    UIImage * newImg = [sepiaFilter imageFromCurrentFramebuffer];
    
    self.gpuImgVIew.image = newImg;
    
    
}

@end
