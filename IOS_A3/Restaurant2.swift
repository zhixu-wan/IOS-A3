//
//  Restaurant2.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit

class Restaurant2: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var eeeee: UIScrollView!
    @IBOutlet weak var uuuuu: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton()
        pictureGallery()
        gallery()
    }
    func pictureGallery(){
            let imageW:CGFloat = self.eeeee.frame.size.width
            let imageH:CGFloat = self.eeeee.frame.size.height
            let imageY:CGFloat = 0
            let totalCount:NSInteger = 5
            for index in 0..<totalCount{
                let imageView:UIImageView = UIImageView();
                let imageX:CGFloat = CGFloat(index) * imageW;
                imageView.frame = CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
                let name:String = String(format: "best%d", index+1);
                imageView.image = UIImage(named: name);
                self.eeeee.showsHorizontalScrollIndicator = false
                self.eeeee.addSubview(imageView)
            }
            let contentW:CGFloat = imageW * CGFloat(totalCount)
        self.eeeee.contentSize = CGSize(width: contentW, height: 0)
            self.eeeee.isPagingEnabled = true
            self.eeeee.delegate = self
         
           
        }
    func gallery(){
            let imageW:CGFloat = self.uuuuu.frame.size.width
            let imageH:CGFloat = self.uuuuu.frame.size.height
            let imageY:CGFloat = 0
            let totalCount:NSInteger = 5
            for index in 0..<totalCount{
                let imageView:UIImageView = UIImageView();
                let imageX:CGFloat = CGFloat(index) * imageW;
                imageView.frame = CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
                let name:String = String(format: "the%d", index+1);
                imageView.image = UIImage(named: name);
                self.uuuuu.showsHorizontalScrollIndicator = false
                self.uuuuu.addSubview(imageView)
            }
            let contentW:CGFloat = imageW * CGFloat(totalCount)
        self.uuuuu.contentSize = CGSize(width: contentW, height: 0)
            self.uuuuu.isPagingEnabled = true
            self.uuuuu.delegate = self
         
           
        }
    
    
    func nextButton() {
        let next = UIButton(frame: CGRect(x: view.layer.frame.midX-50, y: view.layer.frame.maxY-180, width: 100, height: 100))
        next.layer.cornerRadius = 50
        next.clipsToBounds = true
        next.setImage(UIImage(named: "go"), for: .normal)
        view.addSubview(next)
        next.addTarget(self, action: #selector(bookClick), for: .touchUpInside)
    }
    
    @objc func bookClick(sender: UIButton) {
        performSegue(withIdentifier: "fromR2Segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! CustomerInf
        controller.nameRestaurant = restaurantName.text!
    }
}
