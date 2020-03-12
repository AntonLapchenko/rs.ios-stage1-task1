#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSNumber *totalAmount = [array valueForKeyPath:@"@sum.self"];
    NSNumber *maxValue = [array valueForKeyPath:@"@max.self"];
    NSNumber *minValue = [array valueForKeyPath:@"@min.self"];
    
    return @[[NSNumber numberWithInt:[totalAmount intValue] - [maxValue intValue]],
             [NSNumber numberWithInt:[totalAmount intValue] - [minValue intValue]]];
}

@end
