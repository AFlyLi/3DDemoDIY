//
//  Custom3DImageView.h
//  PictureDemo
//
//  Created by 沈海鹏 on 14-6-6.
//  Copyright (c) 2014年 shenhaipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom3DImageView : UIImageView
{
    float initiCoordinateX;
    float initiCoordinateY;
    float endCoordinateX;
    float endCoordinateY;
    int xIndex;
    int yIndex;

}
@property(nonatomic,strong)UIView* selfView;
@end
