#import <Foundation/Foundation.h>

@interface PriorityQueue : NSObject

@property (nonatomic, strong) NSMutableArray* array;
@property (NS_NONATOMIC_IOSONLY, readonly) NSUInteger length;
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSNumber *popMin;

- (instancetype) init NS_UNAVAILABLE;
- (instancetype) initWithSize:(NSUInteger)size NS_DESIGNATED_INITIALIZER;
- (void) insert:(id)item;

@end
