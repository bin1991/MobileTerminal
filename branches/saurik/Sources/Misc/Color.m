//
//  Color.m
//  Terminal

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "Color.h"

UIColor *colorWithRGBA(float red, float green, float blue, float alpha)
{
	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//_______________________________________________________________________________
//_______________________________________________________________________________

@implementation UIColor(ArraySupport)

+ (UIColor *)colorWithArray:(NSArray *)array
{
    return [UIColor colorWithRed:MIN(MAX(0, [[array objectAtIndex:0] floatValue]), 1)
                           green:MIN(MAX(0, [[array objectAtIndex:1] floatValue]), 1)
                            blue:MIN(MAX(0, [[array objectAtIndex:2] floatValue]), 1)
                           alpha:MIN(MAX(0, [[array objectAtIndex:3] floatValue]), 1)];
}

@end

//_______________________________________________________________________________
//_______________________________________________________________________________

@implementation NSArray(ColorSupport)

+ (NSArray *)arrayWithColor:(UIColor *)color
{
    const CGFloat * rgba = CGColorGetComponents([color CGColor]);

    return [NSArray arrayWithObjects:
           [NSNumber numberWithFloat:rgba[0]],
           [NSNumber numberWithFloat:rgba[1]],
           [NSNumber numberWithFloat:rgba[2]],
           [NSNumber numberWithFloat:rgba[3]],
           nil];
}

@end

/* vim: set syntax=objc sw=4 ts=4 sts=4 expandtab textwidth=80 ff=unix: */