//
//  SearchViewController.m
//  final project
//
//  Created by Rataj on 12/5/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
NSArray *City;
NSArray *Price;
NSArray *Space;

NSString *CitySelected;
NSString *PriceSelected;
NSString *SpaceSelected;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    City=@[@"All Cites",@"London",@"Cambridge",@"Liverpool"];
    Price=@[@"All Prices",@"100.000$-199.999$",@"200.000$-299.999$",@"300.000$-399.999$"];
    Space=@[@"All Spaces",@"500-999sqft",@"1000-1999sqft",@"2000-2999"];
 
    //set default values
    CitySelected=@"All Cites";
    PriceSelected=@"All Prices";
    SpaceSelected=@"All Spaces";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView==_CityOutlet) {
        return City.count;
    }
    else if(pickerView==_PriceOutlet)
    {
        return Price.count;
    }
    return Space.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView==_CityOutlet) {
        return City[row];
    }
    else if(pickerView==_PriceOutlet)
    {
        return Price[row];
    }
    return Space[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView==_CityOutlet) {
        CitySelected = City[row];
        
    }
    else if(pickerView==_PriceOutlet)
    {
        PriceSelected = Price[row];
        
    }
    else if(pickerView==_SpaceOutlet)
    {
        SpaceSelected = Space[row];
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"SegueToNextPage"]) {
        TableViewController *destinationViewController=[segue destinationViewController];
        
        destinationViewController.PriceForSearch=PriceSelected;
        destinationViewController.CityForSearch=CitySelected;
        destinationViewController.SpaceForSearch=SpaceSelected;
    }
}

- (IBAction)SearchAction:(id)sender {
    [self performSegueWithIdentifier:@"SegueToNextPage" sender:self];
}

@end
