//
//  Single.h
//  STAdditionsDemo
//
//  Created by ShaoFeng on 2017/2/9.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#if __has_feature(objc_arc)

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(classname) \
\
+ (classname *)shared##classname;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
static dispatch_once_t pred; \
dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
return shared##classname; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##classname = [super allocWithZone:zone]; \
}); \
return shared##classname; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#else

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(classname) \
\
+ (classname *)shared##classname;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
static dispatch_once_t pred; \
dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
return shared##classname; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##classname = [super allocWithZone:zone]; \
}); \
return shared##classname; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\
- (id)retain \
{ \
return self; \
} \
\
- (NSUInteger)retainCount \
{ \
return NSUIntegerMax; \
} \
\
- (oneway void)release \
{ \
} \
\
- (id)autorelease \
{ \
return self; \
}

#endif

