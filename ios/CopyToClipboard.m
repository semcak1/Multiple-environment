//
//  CopyToClipboard.m
//  MultipleEnvironment
//
//  Created by Semih Çakmak on 24.03.2023.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>


@interface RCT_EXTERN_MODULE(CopyToClipboard, NSObject)

RCT_EXTERN_METHOD(funcWithParams: (NSString *)text second:(NSNumber *) second)
RCT_EXTERN_METHOD(basicFunc)
RCT_EXTERN_METHOD(basicFuncCallback:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(asyncFunc:(NSNumber *)num name:(NSString *)name surname:(NSString *)surname resolve:(RCTPromiseResolveBlock)resolve    reject:(RCTPromiseRejectBlock)reject   )
RCT_EXTERN_METHOD(copy:(NSString *)text)
RCT_EXTERN_METHOD(paste:(RCTResponseSenderBlock *)callback)
RCT_EXTERN_METHOD(funcWithOptionalParams:(NSString *)first second:(nonnull NSNumber * )second third:(nonnull NSNumber *)third dic:(NSDictionary *)dic )
@end
