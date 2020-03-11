#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSNumber *invoiceAmount= [bill valueForKeyPath:@"@sum.self"];
    NSInteger brianAmount = [invoiceAmount intValue] - [bill[index] intValue];
    if ([sum intValue] == brianAmount / 2) {
        return @"Bon Appetit";
    } else {
        NSString *result = [NSString stringWithFormat:@"%ld",[sum intValue] - brianAmount / 2];
        return result;
    }
}
@end
