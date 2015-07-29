

extern const CGFloat LuDockPW;
extern const CGFloat LuDockLW;
extern const CGFloat LuScreenPW;
extern const CGFloat LuScreenLW;


extern NSString * const LuTabBarDidSelectionNotification;
extern NSString * const LuTabBarSelectIndex;
//横屏
#define Lanscape ([UIScreen mainScreen].bounds.size.width == LuScreenLW)
//竖屏
#define Portrait ([UIScreen mainScreen].bounds.size.width == LuScreenPW)

#define LuColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

#define LuRandColor LuColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

