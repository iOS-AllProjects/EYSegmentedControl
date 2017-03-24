EYSegmentedControl
==================

Custom segmented control written in swift 3.  
Fully customisable, comes in two styles radius and flat! 

Demo
----
<a href="https://imgflip.com/gif/1lyqkg"><img src="https://i.imgflip.com/1lyqkg.gif" title="made at imgflip.com"/></a>
<a href="https://imgflip.com/gif/1m0zyp"><img src="https://i.imgflip.com/1m0zyp.gif" title="made at imgflip.com"/></a>

Install
-------

##### Requirements

- iOS 10.0+
- Swift 3.0+

##### Manual

Copy & paste `CustomSegmentedControl.swift` in your project

##### CocoaPods 

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```
$ gem install cocoapods
```

To integrate EYSegmentedControl into your Xcode project using CocoaPods, specify it in your ```Podfile```:

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/iOS-AllProjects/EYSegmentedControl.git'

platform :ios, '10.0'
use_frameworks!

target '<Your Target Project Name>' do
pod 'EYSegmentedControl', '0.1.0'
end

```
<b>Or</b>

```
source 'https://github.com/iOS-AllProjects/EYSegmentedControl.git'

platform :ios, '10.0'
use_frameworks!
```

Usage
-----

Drag a `UIView` into your storyboard! Change the class to `CustomSegmentedControl`. The view will be updated! 


### Edit / Add / Remove Labels according to preference!

``` swift
  var items : [String] = ["Item1", "Item2"] 
```
### In storyboard Edit the following properties! 

##### For the UIView
Background Color. 
Corner Radius.
Bottom Border. 

##### For all Labels
Unselected Labels Color.
Highlighted Label Color.
Font Size.

##### For the Highlighted Label
Radius Style.
Flat Style.
Selected Label Background Color.
Selected Label Border Width.
Selected Label Border Color. 

### Create an Outlet for the Control! 

``` swift
    @IBOutlet weak var segmented: CustomSegmentedControl! 
```

### Create a Target for your Outlet! 

``` swift
    func segmentedViewControllerValueChanged(_ sender: Any){
    //Logic goes here and is based on index selection
    }

```

### Add your Target 

``` swift
  segmented.addTarget(self, action: #selector(ViewController.segmentedViewControllerValueChanged(_:)), for: .valueChanged)
```

And that's it! 
