//
//  LSITipController.m
//  Tips
//
//  Created by Alfredo Colon on 8/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

// Import statements copy/paste code to this file
#import "LSITipController.h"
#import "LSITip.h" // Import header files in .m files

// Class extension
// place for private methods, instance variable
@interface LSITipController () {
    // (Optional) Private instance ariables
    NSMutableArray *_tips;
}


// Private Properties
@property (nonatomic, readwrite) NSMutableArray<LSITip *> *internalTips;

// Private Outlets

// Private Methods
@end


@implementation LSITipController


//MARK: - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalTips = [[NSMutableArray alloc] init];
    }
    return self;
}

//MARK: - Computed Properties

// Computed property (no autogenerated _instanceVariable)
- (NSArray<LSITip *> *)tips {
    return [_internalTips copy]; // copy: NSMutableArray -> NSArray
}

//MARK: - Property

- (void)addTip:(LSITip *)tip {
    [self.internalTips addObject:tip];
    
    // FUTURE: Sync to firebase of CoreData
    
}

@end