//
//  ViewController.swift
//  BePrepared
//
//  Created by 原田　礼朗 on 2016/05/28.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

// tableViewを使う準備その1
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var listTableView: UITableView!
    
    // データの配列を用意
    //var data: Array<String>
    //var data: Array<Dictionary<String: String>>
    var data: [[String: String]] = []
    var initData: [[String: String]] = [
        [
            "type": "TEL",
            "who": "両親",
            "number": "08041681211",
        ],
        [
            "type": "TEL",
            "who": "大切な人",
            "number": "08041681211",
        ],
        [
            "type": "TEL",
            "who": "シバター",
            "number": "177",
        ],
        [
            "type": "webSite",
            "keyword": "お腹がいたい時",
            "URL": "https://www.google.co.jp/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=%E3%81%8A%E8%85%B9%E3%81%8C%E3%81%84%E3%81%9F%E3%81%84%E6%99%82",
        ],
        [
            "type": "webSite",
            "keyword": "精神的に逃げだしたい時",
            "URL": "https://www.google.co.jp/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=%E7%B2%BE%E7%A5%9E%E7%9A%84%E3%81%AB%E9%80%83%E3%81%92%E5%87%BA%E3%81%97%E3%81%9F%E3%81%84%E6%99%82",
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tableViewを使う準備その２
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        data = []
        let defaults = NSUserDefaults.standardUserDefaults()
        let addData = defaults.objectForKey("customData") as? [[String: String]]
        if addData != nil {
            data = initData + addData!
            self.listTableView.reloadData()
        }
        else {
            data = initData
        }
    }
    
    // tableViewと相談する↓
    // セクションの数どうする?
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうする？
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    // セルの中身どうする？
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // cellと名前つけた赤いセルでお願いします
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        // もしtypeがTELなら、whoをいれる。もしtypeがwebSiteなら、keywordをいれる
        if self.data[indexPath.row]["type"] == "TEL" {
            cell.textLabel?.text = self.data[indexPath.row]["who"]
        }
        else {
            cell.textLabel?.text = self.data[indexPath.row]["keyword"]
        }
        return cell
    }
    
    // セルを選んだ時どうする？
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // もしtypeがTELなら電話して、typeがwebSiteなら画面遷移して
        if self.data[indexPath.row]["type"] == "TEL" {
            // 電話かける
            // 電話番号
            let telNumber = "tel://08041681211"
            // iPhoneが分かる形に翻訳します
            let nsurl = NSURL(string: telNumber)
            // 上の番号で電話してね
            UIApplication.sharedApplication().openURL(nsurl!)
        }
        else {
            // 画面移動する
            // 移動する画面を呼んでくる
            // 新しく追加した画面を保存するときは、as!で保証する
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("検索結果画面") as! WebSiteViewController
            next.url = self.data[indexPath.row]["URL"]
            // ナビゲーションコントローラーさん、上の呼んできた画面に移動してね
            self.navigationController?.pushViewController(next, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














