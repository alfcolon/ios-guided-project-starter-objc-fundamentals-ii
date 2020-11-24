//
//  LSITIp.m
//  Tips
//
//  Created by Alfredo Colon on 8/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITip.h"

@implementation LSITip

//MARK: - Init

- (instancetype)initWithName:(NSString *)name
                 splitCount:(int)splitCount
               tipPercentage:(double)tipPercentage
                       total:(double)total {
    if (self = [super init]) {
        // always use _propertyName (instance variable)
        _name = name;
        _splitCount = splitCount;
        _tipPercentage = tipPercentage;
        _total = total;
        
        // Do this in Swift, not in Objective-C in your init
        // self.name = name // Can produce side effectts in Objc
    }
    return self;
}

// We can override a property setter/getter

// Overriding the setter
- (void)setName: (NSString *)name {
    // willSet
    
    // #2 Always use _instanceName in sett/getter
    // self.name = name == [self setName:name], it's a recursive call, don't use it
    _name = name;
    
    // didSet
}

// Override the getter
- (NSString *)name {
    return _name;
}

// Creates the instance variable for the property
// when you don't want a computed property
@synthesize name = _name; // creates the instance variable
@end
