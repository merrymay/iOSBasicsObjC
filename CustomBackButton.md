# Customize Navigationbar's appearance  

## Back button using custom image 
### Apple Guide 를 참조할것. trick 사용한 방식들은 대부분 side effect 있음 
### AppDelegate 에서 지정할것

// custom image를 사용한 navigation back button 예시
// - backbutton 을 무조건 숨기고 left bar button 를 back button 처럼 사용하는 방식은, 시스템 back 기능을 사용하지 못하고, os 의 화면(주소록등)을 띄우면 back button 과 left barbutton 이 둘다 나오는 문제가 있다.
// nav height +++++ 14
// Note that images configured as the back bar button's background do
// not have the current tintColor applied to them, they are displayed as it.
UIImage *backButtonImage = [UIImage imageNamed:@"back"];//iconArrLLarge
// The background should be pinned to the left and not stretch.
backButtonImage = [backButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonImage.size.width - 1, 0, 0)];

UINavigationBar.appearance.backIndicatorImage = backButtonImage;
UINavigationBar.appearance.backIndicatorTransitionMaskImage = backButtonImage;


// hide backbutton title
if(@available(iOS 11, *)) {
[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-300, 0) forBarMetrics:UIBarMetricsDefault];
} else {
[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -200) forBarMetrics:UIBarMetricsDefault];
}

