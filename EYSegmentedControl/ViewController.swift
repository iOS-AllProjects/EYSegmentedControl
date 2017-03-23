//
//  ViewController.swift
//  EYSegmentedControl
//
//  Created by Etjen Ymeraj on 3/23/17.
//  Copyright © 2017 Etjen Ymeraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var segmented: CustomSegmentedControl!
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Add target to your UIControl 
        segmented.addTarget(self, action: #selector(ViewController.segmentedViewControllerValueChanged(_:)), for: .valueChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    func segmentedViewControllerValueChanged(_ sender: Any){
        if segmented.selectedIndex == 0{
            print("1")
        }else{
            print("2")
        }
    }

}

