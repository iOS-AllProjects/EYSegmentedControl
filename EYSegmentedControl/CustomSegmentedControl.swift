//
//  CustomSegmentedControl.swift
//  EYSegmentedControl
//
//  Created by Etjen Ymeraj on 3/23/17.
//  Copyright © 2017 Etjen Ymeraj. All rights reserved.
//

import UIKit

@IBDesignable class CustomSegmentedControl: UIControl{
    
    // MARK: - Properties
    
    private var labels = [UILabel]()
    
    private var selectedLabelView = UIView()
    private var bottomBorderLayer = CALayer()
    


    // Edit/add/remove labels
    var items : [String] = ["Item1", "Item2"] { didSet { setupLabels() } }
    
    var selectedIndex : Int = 0 { didSet { displaySelectedLabel() }}
    
    // Mark: Editable Properties
    
    @IBInspectable var backColor: UIColor = UIColor.black {
        didSet {
            self.backgroundColor = backColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var bottomBorderEnabled: Bool = true {
        didSet {
            bottomBorderLayer.removeFromSuperlayer()
            if bottomBorderEnabled {
                // Edit height property
                bottomBorderLayer.frame = CGRect(x: 0, y: layer.bounds.height - 1, width: bounds.width, height: 0.5)
                // Edit bottome border color
                bottomBorderLayer.backgroundColor = UIColor.white.cgColor
                layer.addSublayer(bottomBorderLayer)
            }
        }
    }
    
    @IBInspectable var highlightedLabelColor : UIColor = UIColor.white {
        didSet {
                labels[0].textColor = highlightedLabelColor
        }
    }
    
    @IBInspectable var unSelectedLabelColor : UIColor = UIColor.white {
        didSet {
            for label in labels{
                label.textColor = unSelectedLabelColor  
            }
        }
    }
    
    @IBInspectable var radiusStyle: Bool = false {
        didSet{
            if radiusStyle{
                selectedLabelView.frame = CGRect (
                    x: self.bounds.origin.x,
                    y: self.bounds.origin.y,
                    width: self.bounds.width / CGFloat(items.count),
                    height: self.bounds.height)
                selectedLabelView.layer.cornerRadius = selectedLabelView.frame.height / 2
            }
        }
    }
    
    @IBInspectable var flatStyle: Bool = false {
        didSet{
            if flatStyle{
                selectedLabelView.frame = CGRect (
                    x: self.bounds.origin.x,
                    y: self.bounds.maxY - 4,
                    width: self.bounds.width / CGFloat(items.count),
                    height: 5.0)
            }
        }
    }
    
    @IBInspectable var selectedLabelViewColor : UIColor = UIColor.white {
        didSet {
            selectedLabelView.backgroundColor = selectedLabelViewColor
        }
    }
    
    @IBInspectable var selectedLabelBorderWidth: CGFloat = 1.0 {
        didSet{
            selectedLabelView.layer.borderWidth = selectedLabelBorderWidth
        }
        
    }
    
    @IBInspectable var selectedLabelBorderColor: UIColor = UIColor.clear {
        didSet{
            selectedLabelView.layer.borderColor = selectedLabelBorderColor.cgColor
        }
    
    }
    

    // MARK: - Initializer
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Label height is based on the view bounds
        let labelHeight = self.bounds.height
        // Label width is divided by the number of labels
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
        // xPosition starts from 0 as we used the bounds meaning the view's own coordinate system
        for index in 0...labels.count - 1 {
            let label = labels[index]
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
        
    }
    
    // MARK: - Setup
    
    func setupUI(){
        setupLabels()
        insertSubview(selectedLabelView, at: 0)
    }

    
    func setupLabels(){
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index-1]
            label.textAlignment = .center
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    func displaySelectedLabel(){
        // Get the right label
        let label = labels[selectedIndex]
        // Animate transition
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
            if self.radiusStyle {
                self.selectedLabelView.frame = label.frame
            }
            if self.flatStyle{
                self.selectedLabelView.frame.origin.x = label.frame.origin.x
            }
        }, completion: nil)
    }
    
    // Mark: - Touch Gestures
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex: Int?
        for (index, item) in labels.enumerated(){
            if item.frame.contains(location){
                calculatedIndex = index
                item.textColor = highlightedLabelColor
            } else {
                item.textColor = unSelectedLabelColor   
            }
        }
        
        if calculatedIndex != nil{
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        
        return false
    }
}
