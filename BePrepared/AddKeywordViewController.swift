//
//  AddKeywordViewController.swift
//  BePrepared
//
//  Created by 原田　礼朗 on 2016/07/02.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class AddKeywordViewController: UIViewController {

    @IBOutlet weak var keywordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAddKeywordButton(sender: AnyObject) {
        let keyword = keywordLabel.text

        if keyword == "" {
            return
        }

        let encodeKeyword = keyword?.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let url = "https://www.google.co.jp/webhp?#q=\(encodeKeyword!)"
        let addData: [String: String] = [
            "keyword": keyword!,
            "URL": url,
            "type": "webSite",
            ]
        let defaults = NSUserDefaults.standardUserDefaults()
        var customData = defaults.objectForKey("customData") as? [[String: String]]
        if customData == nil {
            defaults.setObject([addData], forKey: "customData")
        }
        else {
            customData?.append(addData)
            defaults.setObject(customData, forKey: "customData")
        }
        
        self.navigationController?.popViewControllerAnimated(true)
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
