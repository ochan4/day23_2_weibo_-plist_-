//  WeiboUtils.m
//  day23_1_达内微博_weibo开放平台


#import "WeiboUtils.h"

@implementation WeiboUtils

//上传任务！！
+(void)requestTokenWithCode:(NSString *)code andCallback:(MyCallback)callback{
    //在开放平台得到地址
    NSString *path = @"https://api.weibo.com/oauth2/access_token";
    
    //字典：保存参数（发送登陆请求的时候，发送参数）************修改成自己申请的开放平台id和其他 #app key #app secret
    NSDictionary *params = @{@"client_id":@"22467944",@"client_secret":@"1845de95ebdb828ea1b1603757826c52",@"grant_type":@"authorization_code",@"redirect_uri":@"http://www.baidu.com",@"code":code};
   
    //AF创建manager: 神对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //用神对象manager的responseSerializer方法：序列化：同意服务器返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //任务三个方法：上传任务
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //json文件 转换为 NSDictionary
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSLog(@"%@",dic);
        
        //callback() 是MyCallBack的一个对象，此方法可以给vc调回一个object,通过反调用
        callback(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //error错误对象
        NSLog(@"请求失败：%@",error);
    }];
    
    
}
@end
