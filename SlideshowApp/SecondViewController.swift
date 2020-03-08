//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by Yuto Masamura on 2020/03/06.
//  Copyright © 2020 yuto.masamura. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // 2画面目のUIImageViewを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var secondImageView: UIImageView!
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var secondImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secondImageView.image = secondImage
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
