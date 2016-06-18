//
//  AddViewController.swift
//  BePrepared
//
//  Created by 原田　礼朗 on 2016/05/28.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var addTelView: UIView!
    @IBOutlet weak var addKeywordView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addKeywordView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSegmentedControl(sender: AnyObject) {
        // 今の状態の反対にする
        self.addTelView.hidden = !self.addTelView.hidden
        self.addKeywordView.hidden = !self.addKeywordView.hidden
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
