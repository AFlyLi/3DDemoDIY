//
//  Custom3DImageView.m
//  PictureDemo
//
//  Created by 沈海鹏 on 14-6-6.
//  Copyright (c) 2014年 shenhaipeng. All rights reserved.
//

#import "Custom3DImageView.h"
//#define pictureCount 23
//#define GroupCount 4
const NSInteger groupCount = 4;
const NSInteger pictureCount = 23;

@implementation Custom3DImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialization];
    }
    return self;
}
-(void)awakeFromNib
{
    [self initialization];
}
-(void)initialization
{
    self.userInteractionEnabled=YES;
    xIndex=0;
    yIndex=0;
    [self changePicture];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    CGPoint local=[touch locationInView:self.selfView];
    initiCoordinateX=local.x;
    initiCoordinateY=local.y;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    CGPoint local=[touch locationInView:self.selfView];
    endCoordinateX=local.x;
    endCoordinateY=local.y;
    int XTime=320/(pictureCount);
    int YTime=460/(groupCount*16);
    
    if ((int)(endCoordinateX-initiCoordinateX)%XTime==10)//向右
    {
        [self toLeft];
        initiCoordinateX=endCoordinateX;
    }
    if ((int)(endCoordinateX-initiCoordinateX)%XTime==-10)//向左
    {
        
        [self toRight];
        initiCoordinateX=endCoordinateX;
    }
    
    if ((int)(endCoordinateY-initiCoordinateY)%YTime==1)//向上
    {
        [self toUp];
        
    }
    if ((int)(endCoordinateY-initiCoordinateY)%YTime==-1)//向下
    {
        [self toDown];
        
    }
    [self changePicture];
    //    NSLog(@"valueX=%f--valueY=%f",endCoordinateX-initiCoordinateX,endCoordinateY-initiCoordinateY);
}
-(void)toRight
{
    if (xIndex<pictureCount)
    {
        xIndex++;
    }
    else
    {
        xIndex=0;
    }
}
-(void)toLeft
{
    if (xIndex>0)
    {
        xIndex--;
    }
    else
    {
        xIndex=pictureCount;
    }
}
-(void)toUp
{
    if (yIndex<groupCount)
    {
        yIndex++;
    }
    
}
-(void)toDown
{
    if (yIndex>0)
    {
        yIndex--;
    }
}
-(void)changePicture
{
    self.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"img_0_%d_%d[1]",yIndex,xIndex] ofType:@"jpg"]]];
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
