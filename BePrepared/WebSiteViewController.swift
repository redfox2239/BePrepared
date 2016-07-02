//
//  WebSiteViewController.swift
//  BePrepared
//
//  Created by 原田　礼朗 on 2016/07/02.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class WebSiteViewController: UIViewController {

    @IBOutlet weak var searchResult: UIWebView!
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // URLを指定する
        let url = self.url
        // iPhoneが分かる形に翻訳する
        let nsurl = NSURL(string: url)
        // 上のURLのページをリクエストする
        let request = NSURLRequest(URL: nsurl!)
        // searchResultにリクエストしたページを表示する
        self.searchResult.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
