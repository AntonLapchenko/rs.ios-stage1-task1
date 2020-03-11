#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithArray:sadArray];
    for (NSUInteger i = 1; resultArray.count; i++) {
        
        NSInteger startPoint = [resultArray[i] intValue];
        NSInteger sum = [resultArray[i-1] intValue] + [resultArray[i+1] intValue];
        if (startPoint > sum) {
            [resultArray removeObject: resultArray[i]];
            i -= 1;
        }
        if ( i == [resultArray count] - 2)
            break;
        
    }
    
    return resultArray;
}

@end
