//
//  WeiboUtils.h
//  day23_1_达内微博_weibo开放平台

#import "AFNetworking.h"
#import <Foundation/Foundation.h>

//创建宏对象：block方法 用作调用
typedef void (^MyCallback)(id obj);

@interface WeiboUtils : NSObject

//创建工厂方法
+(void)requestTokenWithCode:(NSString *)code andCallback:(MyCallback)callback;

@end
