//
//  RNConfig.m
//  MultipleEnvironment
//
//  Created by Semih Çakmak on 17.03.2023.
//


#import "RNConfig.h"

@implementation RNConfig

RCT_EXPORT_MODULE();

// requiresMainQueueSetup sonradan eklendi
+ (BOOL) requiresMainQueueSetup {
  return YES;
}

- (NSDictionary *)constantsToExport
{
#if DEV
  NSString *env=@"dev";
#else
  NSString *env=@"prod";
#endif
  return @{ @"env":env};
}
+ (BOOL)requireMainQueueSetup
{
  return YES;
}
@end
