# PPModalStatusHUD
PPModalStatusHUD replicates the system default HUD, that appears in the Music, Podcast, etc apps on iOS devices.

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate PPModalStatusHUD into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'PPModalStatusHUD', :git => 'https://github.com/prateek550/PPModalStatusHUD.git'
```
## Usage

Create HUD view instance:
    
    let hudView: PPModalStatusView! = PPModalStatusView(frame: self.view.frame)

Customize image, title, description of HUD:
    
    hudView.set(image: UIImage(named: "tick"), headerText: "Title Text", descriptionText: "some description")
 
 Present HUD:
     
     self.view.addSubview(hudView)

#### Note:- presented hud view will automatically disappear and will be removed from the view hierarchy.
