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
    
    var selectedLabelView = UIView()
    // Edit/add/remove labels
    var items : [String] = ["Item1", "Item2"] { didSet { setupLabels() } }
    
    var selectedIndex : Int = 0 { didSet { displayNewSelectedIndex() }}
    
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
        
        // Selected Frame width based on the number of items
        var selectedFrame = self.bounds
        let newWidth = selectedFrame.width / CGFloat(items.count)
        selectedFrame.size.width = newWidth
        
        // Selected View
        selectedLabelView.frame = selectedFrame
        selectedLabelView.layer.cornerRadius = selectedLabelView.frame.height / 2
        
        // Label
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
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
    
    func displayNewSelectedIndex(){
        // Get the right label
        let label = labels[selectedIndex]
        // Animate transition
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
            self.selectedLabelView.frame = label.frame
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
