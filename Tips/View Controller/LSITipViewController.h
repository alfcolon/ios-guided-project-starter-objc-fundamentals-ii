//
//  LSITipViewController.h
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSITipController;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipViewController : UIViewController

// IBOutlets here would be public api's

//- (void)calculateTip;
@property LSITipController *tipController;
@end

NS_ASSUME_NONNULL_END
