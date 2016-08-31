//
//  UIAlertController+LeftAlign.m
//  SnapEcgDoctor
//
//  Created by baotiao ni on 16/8/31.
//  Copyright © 2016年 baotiao ni. All rights reserved.
//

#import "UIAlertController+LeftAlign.h"
#import <objc/runtime.h>

@implementation UIAlertController(LeftAlign)

/**
 *  Alert文字内容左对齐处理
 */
- (void)setAlign:(NSTextAlignment)align {
    unsigned int count = 0;
    Ivar *property = class_copyIvarList([self class], &count);
    int index = 0;
    for (int i = 0; i < count; i++) {
        Ivar var = property[i];
        const char *name = ivar_getName(var);
        //const char *type = ivar_getTypeEncoding(var);
        NSString *message = [NSString stringWithUTF8String:name];
        if ([message isEqualToString:@"_attributedMessage"]) {
            index = i;
            break;
        }
    }
    Ivar message = property[index];//获取_attributedMessage
    
    //可变字符串
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.message];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = align;//设置对齐方式
    
    [str setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:paragraph, NSForegroundColorAttributeName:[UIColor blackColor]} range:NSMakeRange(0, self.message.length)];
    //最后把message内容替换掉
    object_setIvar(self, message, str);
}

@end
