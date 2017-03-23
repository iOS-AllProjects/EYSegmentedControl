EYSegmentedControl
==================

Custom segmented control written in swift 3.  
Fully customisable.  

Demo
----

![alt tag](Link goes here)
![alt tag](Link goes here)

Install
-------

##### Manual

Copy & paste `CustomSegmentedControl.swift` in your project

##### CocoaPods

``` ruby
use_frameworks!
pod 'EYSegmentedControl'
```

Usage
-----

Drag a `UIView` into your storyboard! Change the class to `CustomSegmentedControl`. The view will be updated! 


##### Edit / Add / Remove Labels according to preference!

``` swift
  var items : [String] = ["Item1", "Item2"] 
```
##### In storyboard Edit the following properties 

#### Background Color 
#### Corner Radius
#### Unselected Labels Color 
#### Selected Label Background Color
#### Selected Label Border Width
#### Selected Label Border Color 

##### Create an Outlet for the Control! 

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

And that is it.

``` swift
 to add
```

To add: 

``` swift
//to add
```
