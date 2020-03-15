#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSString *leftSide = [s substringToIndex:([n integerValue] / 2)];
    NSString *rightSide = [s substringFromIndex:([n integerValue] / 2)];
    NSInteger valueLength = [rightSide length];
    NSInteger enumerator = 0;
    char max = 0;
    
    if ([n integerValue] % 2 != 0) return @"-1";
    
    for (NSInteger i = 0; i < [n integerValue]; i++) {
        if ([s characterAtIndex: i] > max) {
            max = [s characterAtIndex: i];
        }
    }
  
    for (NSInteger position = 0; position < valueLength; position++) {
        NSRange leftDirection = NSMakeRange(position, 1);
        NSRange rightDirection = NSMakeRange(valueLength - position - 1, 1);
        
        if ([rightSide substringWithRange: rightDirection] != [leftSide substringWithRange: leftDirection]  ) {
            
            if ([rightSide characterAtIndex: position] < max  &&
                [leftSide characterAtIndex: position] < max) {
                rightSide = [rightSide stringByReplacingCharactersInRange:
                             rightDirection withString: [NSString stringWithFormat:@"%c", max]];
                leftSide = [leftSide stringByReplacingCharactersInRange:
                            leftDirection withString: [NSString stringWithFormat:@"%c", max]];
                enumerator++;
                continue;
            }
            
            if ([leftSide characterAtIndex:position] > [rightSide characterAtIndex:position]) {
                enumerator++;
                rightSide = [rightSide stringByReplacingCharactersInRange:
                             rightDirection withString: [leftSide substringWithRange: leftDirection]];
            } else {
                enumerator++;
                leftSide = [leftSide stringByReplacingCharactersInRange:
                            leftDirection withString: [rightSide substringWithRange: rightDirection]];
            }
        }
    }
    
    return enumerator <= [k integerValue] ? [leftSide stringByAppendingString: rightSide] : 0;
}

@end
