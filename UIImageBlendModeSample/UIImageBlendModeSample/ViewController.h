//
//  ViewController.h
//  UIImageBlendModeSample
//
//  Created by Dolice on 2013/07/25.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BACK_IMAGE              @"blend_image.png"
#define BACK_IMAGE_WIDTH        640
#define BACK_IMAGE_HEIGHT       1136
#define FRONT_IMAGE             @"Asymmetry_640_1136.jpg"
#define FRONT_IMAGE_WIDTH       640
#define FRONT_IMAGE_HEIGHT      1136
#define FRONT_IMAGE_ALPHA       1.0f
#define PREVIEW_IMAGE_WIDTH     80
#define PREVIEW_IMAGE_HEIGHT    142
#define BLEND_MODE_LABEL_HEIGHT 20

@interface BlendMode : UIView {
@private
    UIImage     *frontImage_;
    UIImage     *backImage_;
    CGBlendMode blendMode_;
}

@property (nonatomic, assign) CGBlendMode blendMode;

- (void)changeMode;

@end

@interface ViewController : UIViewController {
@private
    BlendMode *blendMode_;
    UILabel   *blendModeLabel_;
}

@end
