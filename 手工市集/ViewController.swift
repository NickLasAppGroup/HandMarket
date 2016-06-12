//
//  ViewController.swift
//  手工市集
//
//  Created by 曾偉亮 on 2016/6/12.
//  Copyright © 2016年 TSENG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var city_label:UILabel!
    var city_list:UIScrollView!
    var cityListIsAppear:Bool = false
    let city_name:[String] = ["屏 東","高 雄","台 南","嘉 義","雲 林","彰 化","南 投","台 中","苗 栗","新 竹","桃 園","新 北 市","台 北","基 隆","宜 蘭","花 蓮","台 東"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //***********  city_label  ************
        city_label = UILabel(frame: CGRect(x: 20, y: self.navigationController!.navigationBar.frame.size.height, width: self.view.frame.size.width/2.5, height: self.view.frame.size.width/3))
        city_label.textAlignment = .Center
        city_label.textColor = UIColor.blackColor()
        city_label.font = UIFont.boldSystemFontOfSize(city_label.frame.size.width/3)
        city_label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(city_label)
        
        //***********  city_list  *************
        city_list = UIScrollView(frame: CGRect(x: CGRectGetMaxX(self.view.frame), y: self.navigationController!.navigationBar.frame.size.height + UIApplication.sharedApplication().statusBarFrame.size.height, width: self.view.frame.size.width/2, height: self.view.frame.size.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height))
        city_list.backgroundColor = UIColor.lightGrayColor()
        city_list.alpha = 0.0
        city_list.showsVerticalScrollIndicator = true
        city_list.showsHorizontalScrollIndicator = false
        let space:CGFloat = 5
        let city_list_btsHeight =  city_list.frame.size.height/8
        for cityIndex in 0 ..< self.city_name.count {
            
            let bt = UIButton(frame: CGRect(x: 0, y: CGFloat(cityIndex) * (space + city_list_btsHeight), width: city_list.frame.size.width, height: city_list_btsHeight))
            bt.backgroundColor = UIColor.blackColor()
            bt.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            bt.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            bt.setTitle(self.city_name[cityIndex], forState: .Normal)
            bt.tag = cityIndex
            bt.titleLabel?.font = UIFont.boldSystemFontOfSize(bt.frame.size.height/3)
            bt.titleLabel?.adjustsFontSizeToFitWidth = true
            bt.addTarget(self, action: #selector(ViewController.onCityBTAction(_:)), forControlEvents: .TouchUpInside)
            city_list.addSubview(bt)
        }
        city_list.contentSize = CGSizeMake(self.view.frame.size.width/2,CGFloat(self.city_name.count) * (space + city_list_btsHeight))
        self.view.addSubview(city_list)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onCityBTAction(sender: UIButton) {
        
        var str:String!
        
        switch sender.tag {
        case 0:
            str = self.city_name[0]
        case 1:
            str = self.city_name[1]
        case 2:
            str = self.city_name[2]
        case 3:
            str = self.city_name[3]
        case 4:
            str = self.city_name[4]
        case 5:
            str = self.city_name[5]
        case 6:
            str = self.city_name[6]
        case 7:
            str = self.city_name[7]
        case 8:
            str = self.city_name[8]
        case 9:
            str = self.city_name[9]
        case 10:
            str = self.city_name[10]
        case 11:
            str = self.city_name[11]
        case 12:
            str = self.city_name[12]
        case 13:
            str = self.city_name[13]
        case 14:
            str = self.city_name[14]
        case 15:
            str = self.city_name[15]
        case 16:
            str = self.city_name[16]
        default:
            break
        }
        
        self.city_label.text = str
        
    }

    @IBAction func onBarBtAction(sender: UIBarButtonItem) {
        
        if self.cityListIsAppear == true {
            
            self.cityListIsAppear = false
            UIView.animateWithDuration(1/2, delay: 0.0, options: .CurveEaseInOut, animations: {
                
                self.city_list.alpha = 0.0
                self.city_list.frame.origin = CGPoint(x: CGRectGetMaxX(self.view.frame), y: self.navigationController!.navigationBar.frame.size.height + UIApplication.sharedApplication().statusBarFrame.size.height)
                }, completion: nil)
            
            
        }
        else {
            
            self.cityListIsAppear = true
            
            UIView.animateWithDuration(1/2, delay: 0.0, options: .CurveEaseInOut, animations: {
                
                self.city_list.alpha = 1.0
                self.city_list.frame.origin = CGPoint(x: CGRectGetMidX(self.view.frame), y: self.navigationController!.navigationBar.frame.size.height + UIApplication.sharedApplication().statusBarFrame.size.height)
                }, completion: nil)
            
        }
    }
    
    
}//end class

