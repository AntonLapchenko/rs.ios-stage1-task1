#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSSortDescriptor* ascendingSort = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
    NSSortDescriptor* decreasingSort = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
    
    NSArray *ascendingArray = [array sortedArrayUsingDescriptors: [NSArray arrayWithObject: ascendingSort]];
    NSArray *decreasingArray = [array sortedArrayUsingDescriptors: [NSArray arrayWithObject: decreasingSort]];
    
    NSMutableArray *ascendingMutableArray = [NSMutableArray arrayWithArray: ascendingArray];
    NSMutableArray *decreasingMutableArray = [NSMutableArray arrayWithArray: decreasingArray];
    
    [ascendingMutableArray removeLastObject];
    [decreasingMutableArray removeLastObject];
    
    NSNumber *max = [decreasingMutableArray valueForKeyPath:@"@sum.self"];
    NSNumber *min = [ascendingMutableArray valueForKeyPath:@"@sum.self"];
    
    return @[min, max];
}

@end
