//
//  NullSafe.m
//
//  Version 1.1
//
//  Created by Nick Lockwood on 19/12/2012.
//  Copyright 2012 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/NullSafe
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "NullSafe.h"
#import <objc/runtime.h>


@implementation NSNull (NullSafe)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (!signature)
    {
        if ([NSNumber instancesRespondToSelector:selector])
        {
            return [NSNumber instanceMethodSignatureForSelector:selector];
        }
        else if ([NSValue instancesRespondToSelector:selector])
        {
            return [NSValue instanceMethodSignatureForSelector:selector];
        }
        else if ([NSString instancesRespondToSelector:selector])
        {
            return [NSString instanceMethodSignatureForSelector:selector];
        }
        else if ([NSArray instancesRespondToSelector:selector])
        {
            return [NSArray instanceMethodSignatureForSelector:selector];
        }
        else if ([NSDictionary instancesRespondToSelector:selector])
        {
            return [NSDictionary instanceMethodSignatureForSelector:selector];
        }
        else if ([NSDate instancesRespondToSelector:selector])
        {
            return [NSDate instanceMethodSignatureForSelector:selector];
        }
        else if ([NSData instancesRespondToSelector:selector])
        {
            return [NSData instanceMethodSignatureForSelector:selector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:nil];
}

@end
