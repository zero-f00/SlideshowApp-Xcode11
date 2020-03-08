//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yuto Masamura on 2020/03/04.
//  Copyright © 2020 yuto.masamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // StoryboardのUIImageViewをIBOutletで接続した
    @IBOutlet weak var imageView: UIImageView!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // タイマーを格納するプロパティ変数
    var timer: Timer!
    
    // 定数imagesの配列で、何番目の画像を表示させるのかを判定させるための変数
    // 初期値として0を代入しておく
    // imageView.image = images[imageIndex]のように使うため
    var imageIndex = 0
    
    // 定数imagesに画像を配列として格納する
    let images = [UIImage(named: "1.jpg"), UIImage(named: "2.jpg"), UIImage(named: "3.jpg"), UIImage(named: "4.jpg"), UIImage(named: "5.jpg"), UIImage(named: "6.jpg"), UIImage(named: "7.jpg")]

    // アプリを起動したときに呼ばれるめメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //アプリを起動した直後に表示させるための定数firstImageNum
        // 定数firstImageNumに配列の0番目の値をいれる
        let firstImageNum = images[0]
        
        //UIimageViewに表示させるために、0番目の配列が入った定数firstImageNumを
        //IBOutletで接続した変数imageViewに代入する
        imageView.image = firstImageNum
        
        // 画像をタップしたことを認識するために、UITapGestureRecognizerを使ってインスタンスを生成
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped(_ :)))
        
        // デリゲートをセットする
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "toSecond", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のSecondViewControllerを取得する
            let SecondViewController:SecondViewController = segue.destination as! SecondViewController
            
            // 遷移先のSecondViewControllerで宣言しているsecondImageに値を代入して渡す
            SecondViewController.secondImage = images[imageIndex]!
    }
    
    @IBAction func nextButton(_ sender: Any) {
        // imageIndexの値が7番目の画像と同じとき
        if imageIndex == 6 {
            // 0を代入して最初の1番目の画像を表示させる
            imageIndex = 0
        } else {
            // 7番目(6)の画像でないのときは1を足す
            imageIndex += 1
        }
        // imageIndexで判定させた値を定数imagesの配列番号として判定させる
        // IBOutletで接続した変数UIimageViewに代入する
        imageView.image = images[imageIndex]
    }
    
    @IBAction func backButton(_ sender: Any) {
        // imageIndexの値が１番目の画像と同じ時
        if imageIndex == 0 {
            // 6を代入して最後（7番目）の画像を表示させる
            imageIndex = 6
        } else {
            // それ以外のときはimageIndexから1を引いていく
            imageIndex -= 1
        }
        // imageIndexで判定させた値を定数imagesの配列番号として判定させる
        // IBOutletで接続した変数UIimageViewに代入する
        imageView.image = images[imageIndex]
    }
    
    
    @IBAction func startStopButton(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、timerが存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate() // タイマーを停止する
            self.timer = nil    // updateTimer() の self.timer == nil で判断するために、self.timer = nil としておく
        }
    }
    
     // selector: #selector(updatetimer(_:)) で指定された関数
     // timerInterval: 2.0, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        
        // imageIndexの値が7番目の画像と同じとき
        if imageIndex == 6 {
            // 0を代入して最初の1番目の画像を表示させる
            imageIndex = 0
        } else {
            // 7番目(6)の画像でないのときは1を足す
            imageIndex += 1
        }
        // imageIndexで判定させた値を定数imagesの配列番号として判定させる
        // IBOutletで接続した変数UIimageViewに代入する
        imageView.image = images[imageIndex]
    }
    
    // 遷移先から戻るsegue
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    

}

