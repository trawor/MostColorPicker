//
//  UIImage+MostColor.m
//  Modo
//
//  Created by Travis on 13-5-30.
//  Copyright (c) 2013年 Plumn LLC. All rights reserved.
//

#import "UIImage+MostColor.h"

@implementation UIImage(MostColor)

-(UIColor*)mostColor{
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
	CGContextDrawImage(context, drawRect, self.CGImage);
	CGColorSpaceRelease(colorSpace);
    
	
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
	if (data == NULL) return nil;
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];

    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
	NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
	while ( (curColor = [enumerator nextObject]) != nil )
	{
		NSUInteger tmpCount = [cls countForObject:curColor];
        
		if ( tmpCount < MaxCount ) continue;
		
        MaxCount=tmpCount;
        MaxColor=curColor;
        
	}
    
    NSLog(@"The Color is %@  repeats %d",[MaxColor description],MaxCount);
	return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}


@end
