//
//  LSITIp.h
//  Tips
//
//  Created by Alfredo Colon on 8/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSITip : NSObject

//MARK: - Properties

@property NSString  *name;
@property int       splitCount;
@property double    tipPercentage;
@property double    total;

//MARK: - Methods

//Command + I  - indent
- (instancetype)initWithName:(NSString *)name
                 splitCount:(int)splitCount
               tipPercentage:(double)tipPercentage
                       total:(double)total;


@end

NS_ASSUME_NONNULL_END
