//
//  NetManager.m
//  小dome
//
//  Created by 韩倩云 on 16/9/19.
//  Copyright © 2016年 HanQianyun. All rights reserved.
//

#import "NetManager.h"

@interface NetManager ()

@property (nonatomic, strong) AFHTTPSessionManager * sessionManager;

@end

@implementation NetManager

+ (instancetype)shareManager {
    static NetManager * manager = nil;
    if (!manager) {
        manager = [[NetManager alloc]init];
        manager.sessionManager = [AFHTTPSessionManager manager];
        
        manager.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return manager;
}

- (void)requestURL:(NSString *)url andSuccessBlock:(successBlock)successB andFailedBlock:(failedBlock)failedB {
    [self.sessionManager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        successB([NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failedB(error);
    }];
}

- (void)getDatawithURL:(NSString *)url andParameters:(NSDictionary *)dic andSuccessBlock:(successBlock)successB andFailedBlock:(failedBlock)failedB {
    [self.sessionManager POST:url parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        successB([NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failedB(error);
    }];
}

@end
