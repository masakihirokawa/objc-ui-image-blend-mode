//
//  ViewController.m
//  UIImageBlendModeSample
//
//  Created by Dolice on 2013/07/25.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@implementation BlendMode

@synthesize blendMode = blendMode_;

- (id)init
{
    if (self = [super init]) {
        backImage_ = [UIImage imageNamed:BACK_IMAGE];
        frontImage_ = [UIImage imageNamed:FRONT_IMAGE];
        CGRect newFrame = self.frame;
        newFrame.size = frontImage_.size;
        self.frame = newFrame;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [backImage_ drawInRect:rect];
    [frontImage_ drawInRect:rect blendMode:blendMode_ alpha:FRONT_IMAGE_ALPHA];
}

- (void)changeMode
{
    if (kCGBlendModeLuminosity < ++blendMode_) {
        blendMode_ = kCGBlendModeNormal;
    }
}

@end

#pragma mark private methods definition

@interface ViewController ()

- (void)changeLabel;

@end

#pragma mark start implementation for methods

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初期化
    blendMode_ = [[BlendMode alloc] init];
    blendMode_.center = self.view.center;
    blendMode_.autoresizingMask =
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:blendMode_];
    
    //重ねて表示するイメージ表示
    UIImage *imageBack = [UIImage imageNamed:BACK_IMAGE];
    UIImageView *imageViewBack = [[UIImageView alloc] initWithImage:imageBack];
    imageViewBack.frame = CGRectMake(0, 0, BACK_IMAGE_WIDTH, BACK_IMAGE_HEIGHT);
    imageViewBack.autoresizingMask =
        UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:imageViewBack];
    
    //プレビューイメージ表示
    UIImage *imageFront = [UIImage imageNamed:FRONT_IMAGE];
    UIImageView *imageViewFront = [[UIImageView alloc] initWithImage:imageFront];
    imageViewFront.frame = CGRectMake(320 - PREVIEW_IMAGE_WIDTH,
                                      0,
                                      PREVIEW_IMAGE_WIDTH,
                                      PREVIEW_IMAGE_HEIGHT);
    imageViewFront.autoresizingMask = imageViewFront.autoresizingMask;
    [self.view addSubview:imageViewFront];
    
    //ブレンドモードを変更するラベル表示
    blendModeLabel_ = [[UILabel alloc] init];
    blendModeLabel_.frame = CGRectMake(0,
                                       self.view.bounds.size.height - BLEND_MODE_LABEL_HEIGHT,
                                       self.view.bounds.size.width,
                                       BLEND_MODE_LABEL_HEIGHT);
    blendModeLabel_.autoresizingMask =
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin;
    blendModeLabel_.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:blendModeLabel_];
    
    //ラベル変更
    [self changeLabel];
}

#pragma mark private methods

- (void)changeLabel {
    switch (blendMode_.blendMode) {
        case kCGBlendModeMultiply:        blendModeLabel_.text = @"kCGBlendModeMultiply"; break;        /* 乗算 */
        case kCGBlendModeScreen:          blendModeLabel_.text = @"kCGBlendModeScreen"; break;          /* スクリーン */
        case kCGBlendModeOverlay:         blendModeLabel_.text = @"kCGBlendModeOverlay"; break;         /* オーバーレイ */
        case kCGBlendModeDarken:          blendModeLabel_.text = @"kCGBlendModeDarken"; break;          /* 比較（暗） */
        case kCGBlendModeLighten:         blendModeLabel_.text = @"kCGBlendModeLighten"; break;         /* 比較（明） */
        case kCGBlendModeColorDodge:      blendModeLabel_.text = @"kCGBlendModeColorDodge"; break;      /* 覆い焼きカラー */
        case kCGBlendModeColorBurn:       blendModeLabel_.text = @"kCGBlendModeColorBurn"; break;       /* 焼きこみカラー */
        case kCGBlendModeSoftLight:       blendModeLabel_.text = @"kCGBlendModeSoftLight"; break;       /* ソフトライト */
        case kCGBlendModeHardLight:       blendModeLabel_.text = @"kCGBlendModeHardLight"; break;       /* ハードライト */
        case kCGBlendModeDifference:      blendModeLabel_.text = @"kCGBlendModeDifference"; break;      /* 差の絶対値 */
        case kCGBlendModeExclusion:       blendModeLabel_.text = @"kCGBlendModeExclusion"; break;       /* 除外 */
        case kCGBlendModeHue:             blendModeLabel_.text = @"kCGBlendModeHue"; break;             /* 色相 */
        case kCGBlendModeSaturation:      blendModeLabel_.text = @"kCGBlendModeSaturation"; break;      /* 彩度 */
        case kCGBlendModeColor:           blendModeLabel_.text = @"kCGBlendModeColor"; break;           /* カラー */
        case kCGBlendModeLuminosity:      blendModeLabel_.text = @"kCGBlendModeLuminosity"; break;      /* 輝度 */
        case kCGBlendModeClear:           blendModeLabel_.text = @"kCGBlendModeClear"; break;           /* 透明色で描画 */
        case kCGBlendModeCopy:            blendModeLabel_.text = @"kCGBlendModeCopy"; break;            /* コピー */
        case kCGBlendModeSourceIn:        blendModeLabel_.text = @"kCGBlendModeSourceIn"; break;
        case kCGBlendModeSourceOut:       blendModeLabel_.text = @"kCGBlendModeSourceOut"; break;
        case kCGBlendModeSourceAtop:      blendModeLabel_.text = @"kCGBlendModeSourceAtop"; break;
        case kCGBlendModeDestinationOver: blendModeLabel_.text = @"kCGBlendModeDestinationOver"; break;
        case kCGBlendModeDestinationIn:   blendModeLabel_.text = @"kCGBlendModeDestinationIn"; break;
        case kCGBlendModeDestinationOut:  blendModeLabel_.text = @"kCGBlendModeDestinationOut"; break;
        case kCGBlendModeDestinationAtop: blendModeLabel_.text = @"kCGBlendModeDestinationAtop"; break;
        case kCGBlendModeXOR:             blendModeLabel_.text = @"kCGBlendModeXOR"; break;
        case kCGBlendModePlusDarker:      blendModeLabel_.text = @"kCGBlendModePlusDarker"; break;
        case kCGBlendModePlusLighter:     blendModeLabel_.text = @"kCGBlendModePlusLighter"; break;
        default:                          blendModeLabel_.text = @"kCGBlendModeNormal"; break;
    }
}

#pragma mark responder

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //ブレンドモード変更
    [blendMode_ changeMode];
    
    //ラベルの変更
    [self changeLabel];
    
    //ブレンド実行
    [blendMode_ setNeedsDisplay];
}

@end
