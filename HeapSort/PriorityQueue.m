#import "PriorityQueue.h"

#define ROOT 0


@interface NSArray (Comparisons)
- (NSComparisonResult) compareObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2;
@end

@implementation NSArray (Comparisons)
- (NSComparisonResult) compareObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2
{
    return [self[index1] compare:self[index2]];
}
@end


@implementation PriorityQueue {
    NSUInteger _lastIndex;
    NSUInteger _maxSize;
}

- (instancetype)init { @throw nil; } 

- (instancetype) initWithSize:(NSUInteger)size
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] initWithCapacity:size];
        _maxSize = size;
        _lastIndex = ROOT;
    }
    return self;
}

- (void) insert:(id)element
{
    NSAssert([element respondsToSelector:@selector(compare:)], @"???");
    if (_lastIndex == _maxSize) {
        return;
    }
    NSUInteger elementIndex = _lastIndex++;
    [_array insertObject:element atIndex:elementIndex];

    NSUInteger parentIndex = [self parent:elementIndex];
    while (elementIndex && NSOrderedDescending == [_array compareObjectAtIndex:parentIndex withObjectAtIndex:elementIndex]) {
        [_array exchangeObjectAtIndex:elementIndex withObjectAtIndex:parentIndex];
        elementIndex = parentIndex;
        parentIndex = [self parent:elementIndex];
    }
}

- (void) _heapify:(NSUInteger) elementIndex
{
    NSUInteger const lastIndex = [self length] - 1;

    while (TRUE) {
        NSUInteger leftChild = [self leftChildOf:elementIndex];
        NSUInteger rightChild = [self rightChildOf:elementIndex];

        NSUInteger smallest;
        if (leftChild <= lastIndex && (NSOrderedDescending == [_array compareObjectAtIndex:elementIndex withObjectAtIndex:leftChild])) {
            smallest = leftChild;
        } else {
            smallest = elementIndex;
        }
        if (rightChild <= lastIndex) {
            if (NSOrderedDescending == [_array compareObjectAtIndex:smallest withObjectAtIndex:rightChild]) {
                smallest = rightChild;
            }
        }

        if (smallest == elementIndex) {
            break;
        }

        [_array exchangeObjectAtIndex:elementIndex withObjectAtIndex:smallest];
        elementIndex = smallest;
    }
}

- (NSUInteger) parent:(NSUInteger)x
{
    return ((x + (x & 1)) / 2) - 1;
}

- (NSUInteger) leftChildOf:(NSUInteger)x
{
    return [self rightChildOf:x] - 1;
}

- (NSUInteger) rightChildOf:(NSUInteger)x
{
    return (x + 1) * 2;
}

- (NSString*) description
{
    return _array.description;
}

- (NSUInteger) length
{
    return _array.count;
}

- (id) popMin
{
    id minValue = _array[0];
    [_array removeObjectAtIndex:0];
    [self _heapify:0];
    return minValue;
}

@end
