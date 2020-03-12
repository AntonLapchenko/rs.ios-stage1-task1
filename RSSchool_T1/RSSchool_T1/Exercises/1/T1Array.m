#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (!sadArray.count) {
        return @[];
    }
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithArray:sadArray];
    BOOL isDeletedItem = YES;
    NSInteger middleItem = 0;
    NSInteger sum = 0;
    
    while (isDeletedItem == YES) {
        isDeletedItem = NO;
        for (NSInteger i = 1; i < resultArray.count-1; i++) {
            middleItem = [resultArray[i] integerValue];
            sum = [resultArray[i-1] integerValue] + [resultArray[i+1] integerValue];
            if (sum <= middleItem) {
                [resultArray removeObjectAtIndex:i];
                isDeletedItem = YES;
            }
        }
    }
    return [NSArray arrayWithArray:resultArray];
}
@end
