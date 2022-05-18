//
//  Restaurant1.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit

class Restaurant1: UIViewController, UIScrollViewDelegate {
    var timer:Timer!

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func pictureGallery(){ 
            let imageW:CGFloat = self.ScrollView.frame.size.width
            let imageH:CGFloat = self.ScrollView.frame.size.height
            let imageY:CGFloat = 0
            let totalCount:NSInteger = 5
            for index in 0..<totalCount{
                let imageView:UIImageView = UIImageView();
                let imageX:CGFloat = CGFloat(index) * imageW;
                imageView.frame = CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
                let name:String = String(format: "pizza%d", index+1);
                imageView.image = UIImage(named: name);
                self.ScrollView.showsHorizontalScrollIndicator = false
                self.ScrollView.addSubview(imageView)
            }
            let contentW:CGFloat = imageW * CGFloat(totalCount)
        self.ScrollView.contentSize = CGSize(width: contentW, height: 0)
            self.ScrollView.isPagingEnabled = true
            self.ScrollView.delegate = self
            self.pageControl.numberOfPages = totalCount
            self.addTimer()
        }
    
    func nextImage(sender:AnyObject!){
            var page:Int = self.pageControl.currentPage;
            if(page == 4){
                page = 0;
            }else{
                page += 1
            }
            let x:CGFloat = CGFloat(page) * self.ScrollView.frame.size.width;
        self.ScrollView.contentOffset = CGPoint(x: x, y: 0)
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                let scrollviewW:CGFloat = ScrollView.frame.size.width
                let x:CGFloat = ScrollView.contentOffset.x
                let page:Int = (Int)((x + scrollviewW / 2) / scrollviewW)
                self.pageControl.currentPage = page;
        }
    
    func addTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: Selector(("nextImage:")), userInfo: nil, repeats: true)
    }
}

