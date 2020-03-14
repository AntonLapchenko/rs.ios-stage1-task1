#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSArray *openBrackets = [NSArray arrayWithObjects:@"<",@"[",@"(", nil];
    NSArray *closeBrackets = [NSArray arrayWithObjects:@">",@"]",@")", nil];
    NSMutableArray<NSString *> *resultArray = [NSMutableArray new];
    NSUInteger repeat = 0;
    
    for (NSInteger letter = 0; letter < [string length]; letter++) {
        for (NSInteger bracket = 0; bracket < openBrackets.count; bracket++) {
            if ([NSString stringWithFormat:@"%C",[string characterAtIndex: letter]] ==
                [NSString stringWithFormat:@"%@",[openBrackets objectAtIndex:bracket]]) {
                
                for (NSInteger i = letter + 1; i < [string length]; i++) {
                    
                    if ([NSString stringWithFormat:@"%C",[string characterAtIndex: i]] ==
                        [NSString stringWithFormat:@"%@",[openBrackets objectAtIndex: bracket]]) {
                        repeat++;
                        continue;
                    }
                    
                    if ([NSString stringWithFormat:@"%C",[string characterAtIndex: i]] ==
                        [NSString stringWithFormat:@"%@",[closeBrackets objectAtIndex: bracket]] && repeat != 0) {
                        repeat--;
                        continue;
                    }
                    
                    if ([NSString stringWithFormat:@"%C",[string characterAtIndex: i]] ==
                        [NSString stringWithFormat:@"%@",[closeBrackets objectAtIndex: bracket]] && repeat == 0) {
                        [resultArray addObject:[string substringWithRange: NSMakeRange(letter + 1, i - letter - 1)]];
                        break;
                    }
                }
            }
        }
    }
    
    return resultArray;
}

@end
