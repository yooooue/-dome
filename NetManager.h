//
//  NetManager.h
//  小dome
//
//  Created by 韩倩云 on 16/9/19.
//  Copyright © 2016年 HanQianyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^successBlock)(id data);

typedef void (^failedBlock)(NSError * error);

@interface NetManager : NSObject

+ (instancetype)shareManager ;

- (void)requestURL:(NSString *)url andSuccessBlock:(successBlock)successB andFailedBlock:(failedBlock)failedB ;

- (void)getDatawithURL:(NSString *)url andParameters:(NSDictionary *)dic andSuccessBlock:(successBlock)successB andFailedBlock:(failedBlock)failedB ;

@end
