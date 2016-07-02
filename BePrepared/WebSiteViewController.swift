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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // URLを指定する
        let url = "https://www.google.co.jp/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=%E3%81%8A%E8%85%B9%E3%81%8C%E3%81%84%E3%81%9F%E3%81%84%E6%99%82"
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
