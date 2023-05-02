//
//  ViewController.swift
//  HW_ChangePage
//
//  Created by 曹家瑋 on 2023/5/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieContentTextView: UITextView!
    @IBOutlet weak var movieSegmentedControl: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var movieCoverImageView: UIImageView!

    // 電影海報項目
    let movies = ["魔女宅急便", "紅豬", "神隱少女"]
    
    // 電影文本設置
    let moviesDescription = ["琪琪是一個實習魔女。依家族慣例，13歲的琪琪該離開家鄉，到新的城市展開獨立生活，修行成正式的魔女。她用她媽媽的掃帚，帶著她的同伴黑貓吉吉去開展她的新生活。\n有一天，琪琪因為心情鬱悶、對自己的行為感到疑惑時失去了法力。最終琪琪在她的新朋友兼畫家烏露絲拉的幫助下，克服了這些障礙。在一次飛船的意外中，琪琪為了拯救蜻蜓，在千鈞一髮之際恢復了飛行的能力並成功救了他。經過此事，琪琪的義舉獲得眾人的讚許與敬重，讓她重拾信心，繼續在城市裡執行送貨服務。", "第一次世界大戰時期義大利空軍的王牌飛行員波魯克・羅梭中了魔法變成了一頭豬。如今他成了一名賞金獵人，專門在亞得里亞海空域阻擊空中劫匪。劫匪們為了打倒羅梭從美國請來了超級飛行員卡地士。\n卡地士趁羅梭的飛機引擎發生故障之時將其擊落。羅梭把愛機送往老朋友保可洛的工廠修理，在那裡遇到了保可洛的孫女菲奧。菲奧完美地修復了羅梭的座機，和羅梭一起重返藍天。\n而等待他們的卻是那批空中劫匪。為了爭奪菲奧，卡地士向羅梭提出決鬥。在決鬥前夜，羅梭向菲奧講述了自己在一戰中經歷。次日，在大批空中劫匪以及菲奧的注視下，決鬥開始了。最後因與卡地士在空戰中無法分出高下，而改以肉搏拳賽打敗了卡地士，也贏得了榮耀。", "年僅十歲的少女千尋與父母一同驅車前往新家，途中迷路車子來到一道拱門前，千尋與父母下車穿越拱門到達一處荒廢的日式小鎮。千尋心生害怕，但是千尋的父母卻在未經主人同意的情況下，大大方方的取用食物，轉眼間，他們變成了兩頭豬。\n原來千尋與父母來到神靈休憩的小城，所有的食物都是呈現給神靈的供品，千尋的父母為了自己的慾望，取用了不屬於他們的食物。\n千尋在驚嚇之餘遇見了似曾相識的少年哈克，哈克對千尋伸出援手，教導千尋在神靈世界的生存之道。千尋在哈克的指點之下，向開設澡堂湯婆婆毛遂自薦。\n唯利是圖的湯婆婆在拗不過千尋的請託之下，答應讓千尋在她開設的澡堂裡工作，並且將千尋的名字改為「小千」。" ]
    
    // index追蹤陣列
    var index = 0
    
    // 設置一個 function: 關於圖片文本切換
    func updateMovieInformation() {
        
        // movie封面
        let moviesName = movies[index]
        movieCoverImageView.image = UIImage(named: moviesName)
        
        // movie文本內容
        movieContentTextView.text = moviesDescription[index]

        // pageControl 的 outlet 連動
        pageControl.currentPage = index

        // segmentedControl 的 outlet 連動
        movieSegmentedControl.selectedSegmentIndex = index
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 先將此 function 加至 viewDidLoad 保持登入最新狀態
        updateMovieInformation()

        // 設置 ImageView 屬性
        movieCoverImageView.image = UIImage(named: "魔女宅急便")
        movieCoverImageView.layer.cornerRadius = 20
    }

    @IBAction func goToNextPage(_ sender: Any) {
        // Button 下一頁 (movies.count = 3)
        index = (index + 1) % movies.count
        
        updateMovieInformation()
        
    }

    @IBAction func goToPreviousPage(_ sender: Any) {
        // Button 上一頁
        index = (index + movies.count - 1) % movies.count
        
        updateMovieInformation()
    }

    @IBAction func pageControlDidChange(_ sender: UIPageControl) {
        // pageControl 當前頁面
        index = sender.currentPage
        
        updateMovieInformation()
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // segmentedControl 當前選項
        index = sender.selectedSegmentIndex
        
        updateMovieInformation()
    }
    
}


//import UIKit
//
//class ViewController: UIViewController {
//
//
//
//    @IBOutlet weak var movieSegmentedControl: UISegmentedControl!
//    @IBOutlet weak var pageControl: UIPageControl!
//    // 電影海報
//    @IBOutlet weak var movieCoverImageView: UIImageView!
//
//    // 電影海報項目, index追蹤陣列
//    let movies = ["魔女宅急便", "紅豬", "神隱少女"]
//    var index = 0
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        movieCoverImageView.image = UIImage(named: "魔女宅急便")
//        movieCoverImageView.layer.cornerRadius = 20
//
//    }
//
//    @IBAction func goToNextPage(_ sender: Any) {
//        // Button 下一頁 (movies.count = 3)
//        index = (index + 1) % movies.count
//        let moviesName = movies[index]
//        movieCoverImageView.image = UIImage(named: moviesName)
//
//        // pageControl 的 outlet 連動
//        pageControl.currentPage = index
//
//        // SegmentedControl 的 outlet 連動
//        movieSegmentedControl.selectedSegmentIndex = index
//    }
//
//    @IBAction func goToPreviousPage(_ sender: Any) {
//        // Button 上一頁
//        index = (index + movies.count - 1) % movies.count
//        let moviesName = movies[index]
//        movieCoverImageView.image = UIImage(named: moviesName)
//
//        // pageControl 的 outlet 連動
//        pageControl.currentPage = index
//
//        // segmentedControl 的 outlet 連動
//        movieSegmentedControl.selectedSegmentIndex = index
//    }
//
//    @IBAction func pageControlDidChange(_ sender: UIPageControl) {
//        // pageControl 當前頁面
//        index = sender.currentPage
//        let moviesName = movies[index]
//        movieCoverImageView.image = UIImage(named: moviesName)
//
//        // segmentedControl 的 outlet 連動
//        movieSegmentedControl.selectedSegmentIndex = index
//    }
//
//    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
//
//        index = sender.selectedSegmentIndex
//        let moviesName = movies[index]
//        movieCoverImageView.image = UIImage(named: moviesName)
//
//        // pageControl 的 outlet 連動
//        pageControl.currentPage = index
//
//    }
//
//
//}
