//
//  LSITipController.h
//  Tips
//
//  Created by Alfredo Colon on 8/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
// Build projects faster using forward class declarations and can
// reference other classes "recursively"

@class LSITip; // forward class declaration (IOU) here;s a heads up about a new class

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

//MARK: - Properties

// atomic * - default, synchronizes the data so it can't be interrupted
// nonatomic - used for when you are going to override a property

// readwrite * - default, setter and getter
// readonly - only a getter

@property (nonatomic, readwrite) NSArray<LSITip *> *tips;

//MARK: - Methods

- (void) addTip: (LSITip *)tip;

@end

NS_ASSUME_NONNULL_END
