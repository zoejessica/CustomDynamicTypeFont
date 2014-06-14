//
//  UIFont+ZJCustom.m
//  CustomFontTester
//
//  Created by Zoë Smith on 12/06/2014.
//  Copyright (c) 2014 Rao Studios. All rights reserved.
//

#import "UIFont+ZJCustom.h"

NSString *const ZJFontTextStyleHeadline2 = @"ZJFontTextStyleHeadline2";

@implementation UIFont (ZJCustom)

+ (UIFont *)customFontForTextStyle:(NSString *)textStyle {
    
    if (![[UIFont fontCache]objectForKey:textStyle]) {
        // Create cache for this content size if it doesn't exist
        [[UIFont fontCache] setObject:[[NSMutableDictionary alloc] init] forKey:textStyle];
    }
    
    NSString * contentSize = [[UIApplication sharedApplication] preferredContentSizeCategory];
    if(![[[UIFont fontCache] objectForKey:textStyle] objectForKey:contentSize]) {

        NSString *fontName = [self customFontFaceForTextStyle:textStyle contentSize:contentSize];
        NSNumber *fontSize = [self pointSizeForTextStyle:textStyle contentSize:contentSize];
        
        UIFontDescriptor *customFontDescriptor = [UIFontDescriptor fontDescriptorWithName:fontName
                                                  size:[fontSize floatValue]];
        UIFont *customFont = [UIFont fontWithDescriptor:customFontDescriptor size:[fontSize floatValue]];
        NSMutableDictionary *textStyleDictionary = [[UIFont fontCache] objectForKey:textStyle];
        [textStyleDictionary setValue:customFont forKey:contentSize];
    }
    
    return [[[UIFont fontCache] objectForKey:textStyle] objectForKey:contentSize];
}

+ (NSString *)customFontFaceForTextStyle:(NSString *)textStyle contentSize:(NSString *)contentSize {
    return [self completeContentProperties][textStyle][contentSize][@"fontName"];
}

+ (NSNumber *)pointSizeForTextStyle:(NSString *)textStyle contentSize:(NSString *)contentSize {
    return [self completeContentProperties][textStyle][contentSize][@"size"];
}

+ (NSDictionary *)completeContentProperties {
    static NSDictionary *completeContentProperties;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"customPreferredFontLato" ofType:@"plist"];
        completeContentProperties = [NSDictionary dictionaryWithContentsOfFile:path];

    });
    
    
    return completeContentProperties;
}

+ (NSCache *) fontCache {
    static NSCache * _fontCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fontCache = [[NSCache alloc] init];
    });
    return _fontCache;
}

/*
 
 fontCache {
    text style :  NSMutableDictionary { content size : UIFont }
 }
 
 
 
 
 
 */


@end
