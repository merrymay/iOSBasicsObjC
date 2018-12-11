#  How to enable Swift in Objc Project

- https://medium.com/@marecek_tn/enable-swift-for-obj-c-project-6e2eae223a30

## Build Settings 
Now open your XCode and go to Project / Build Settings. Now do this:
- Defines Module : YES
- Always Embed Swift Standard Libraries : YES
- Install Objective-C Compatibility Header : YES ( Swift Class 하나 만들면 자동으로 enabled 됨)
Clean, Build and add “ModuleName-Swift.h” header to .m files.

### Support multiple-target  
Previous answers have some problems if you decide to rename your targets or project, or use SWIFT_MODULE_NAME as intended.

The most universal solution is to change SWIFT_OBJC_INTERFACE_HEADER_NAME (“Objective-C Generated Interface Header Name”) under Project's, not Targets, Build Settings, to:
 
$(PROJECT_NAME)-Swift.h — one per project;
$(SWIFT_MODULE_NAME)-Swift.h — one per module (default value).


## Obj-C class 에서 Swift class 사용 
- import header 
#import "KTFamilyBox-Swift.h" 

## Swift class 에서 Obj-C class 사용 
- ModuleName-Swift.h 에 자동으로 import 되므로 별도 작업 필요없음 


