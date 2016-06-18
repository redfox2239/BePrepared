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
    var data: [String] = [
        "両親",
        "大切な人",
        "シバター",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tableViewを使う準備その２
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
    }
    
    // tableViewと相談する↓
    // セクションの数どうする?
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうする？
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // セルの中身どうする？
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // cellと名前つけた赤いセルでお願いします
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    
    // セルを選んだ時どうする？
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 電話かける
        // 電話番号
        let telNumber = "tel://08041681211"
        // iPhoneが分かる形に翻訳します
        let nsurl = NSURL(string: telNumber)
        // 上の番号で電話してね
        UIApplication.sharedApplication().openURL(nsurl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














