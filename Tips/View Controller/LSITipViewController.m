//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "LSITipController.h"
#import "LSITip.h"

// Class extension (Private attributes)
@interface LSITipViewController () <UITableViewDelegate, UITableViewDataSource>

// Private Properties

@property (nonatomic) double percentage;
@property (nonatomic) int split;
@property (nonatomic) double tip;
@property (nonatomic) double total;


// Private IBOutlets

// Prefer strong with outlets
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property (strong, nonatomic) IBOutlet UISlider *percentageSlider;
@property (strong, nonatomic) IBOutlet UILabel *splitLabel;
@property (strong, nonatomic) IBOutlet UIStepper *splitStepper;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UITextField *totalTextField;

// Private Methods

- (void)calculateTip;
- (void)updateViews;
- (void)saveTipNamed:(NSString *)name;

@end

@implementation LSITipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Move to init or computed property
    self.tipController = [[LSITipController alloc] init];
    
    // hide keyboard
//     textField.resignFirstResponder();
    
    //Use a tap gesture recognizer with this statement to hude keyboard (on view)
//    [self.view endEditing:false];
    
}

- (void)calculateTip {
    // TODO: Calculate the tip using the values from the UI
    self.percentage = round(self.percentageSlider.value);
    self.total = [self.totalTextField.text doubleValue];
    self.split = self.splitStepper.value;
    
    self.tip = self.total * (self.percentage / 100.0) / self.split;
    
    [self updateViews];
}

- (void)updateViews {
    // TODO: Use the model data to update the views
    self.splitStepper.value = self.split;
    self.percentageSlider.value = self.percentage;
    self.totalTextField.text = [NSString stringWithFormat:@"%.2f", self.total];
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", self.tip];
    self.splitLabel.text = [NSString stringWithFormat:@"$%d", self.split];
    
    self.percentageLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.percentage]; 
}

- (void)saveTipNamed:(NSString *)name {
    
    // TODO: Save the tip to the controller and update tableview

    LSITip *tip = [[LSITip alloc] initWithName:name
                                    splitCount:self.split
                                 tipPercentage:self.tip
                                         total:self.total];
    
    [self.tipController addTip:tip];
    [self.tableView reloadData];
    
}

// MARK: - IBActions

- (IBAction)updateSplit:(UIStepper *)sender {
    self.split = round(self.splitStepper.value);
    [self calculateTip];
}

- (IBAction)updatePercentage:(UISlider *)sender {
    self.percentage = round(self.percentageSlider.value);
    [self calculateTip];
}

- (IBAction)saveTipButtonPressed:(UIButton *)sender {
    [self showSaveTipAlert];
}



// TODO: Connect actions for splitChanged, sliderChanged, and Save Tip button


// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tipController.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    LSITip *tip = [self.tipController.tips objectAtIndex:indexPath.row];
    cell.textLabel.text = tip.name;
    
    return cell;
}

// MARK: - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

// TODO: Load the selected tip from the controller

//}

// MARK: - Alert Helper

- (void)showSaveTipAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save Tip"
                                message:@"What name would you like to give to this tip?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Tip Name:";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = [[alert.textFields firstObject] text];
        if (name.length > 0) {
            [self saveTipNamed: name];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
