//
//  ViewController.swift
//  Catch_Frog
//
//  Created by Hwan의 MacBook Pro on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {

    //DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HoleButtonArray = [Holebtn1,Holebtn2,Holebtn3,Holebtn4,Holebtn5]
        frogimage = [UIImage(named: "frog1.png")!,UIImage(named: "frog2.png")!,UIImage(named: "frog3.png")!,UIImage(named: "frog4.png")!,UIImage(named: "frog5.png")!] // frog 이미지들

        while elapsedTime != 0.0 {
            let random = arc4random() % 5
        }
    }
    
    
    // 게임 초기화
    func Nextgame (){
        FrogCounter = 0
        FrogCount.text = String(format: "%d",FrogCounter) // 잡은 수 초기화
        elapsedTime = 30.0 // 남은시간 30초
        Time.text = String(format: "%d", elapsedTime)
    }
    
    //Rank 갱신
    func RankUpdate(_ FrogCatchCount:Int){
        
        // 랭킹이 비어있는 경우
        if ranknameArray.isEmpty {
            ranknameArray.append(Huntername.text!)
            rankscoreArray.append(FrogCounter)
        }
        else{
            var count:Int = 0 // 배열 인덱스용
            for i in rankscoreArray {
                if FrogCounter > i {
                    rankscoreArray.insert(FrogCounter, at: count)
                    ranknameArray.insert(Huntername.text!, at: count)
                }else{
                    count += 1
                }
            }
        }
    }
    
    
    
    
    
    // Object
    var HoleButtonArray: Array<UIButton> = [] //버튼 상태 저장
    var rank:Array<String> = [] // 랭크 저장용
    var elepsedTime = 0.0 // 지나간 시간
    var FrogCounter = 0 // 잡은 개구리수
    var StartTime:Data = Data() // 현재 시간정보
    var elapsedTime = 0.0 // 남은 시간
    var rankscoreArray:Array<Int> = []
    var ranknameArray:Array<String> = []
    var frogimage:Array<UIImage> = []
    
    
    //RESTART
    @IBAction func Restart(_ sender: UIButton) {
        if elapsedTime == 0.0 { // 게임종료여부
            Nextgame()
        }else{
            // 게임중단 승인
            //return
        }
    }
    
    // Label
    @IBOutlet weak var Huntername:UILabel!
    @IBOutlet weak var Modename:UILabel!
    @IBOutlet weak var FrogCount: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var Holebtn1:UIButton!
    @IBOutlet weak var Holebtn2:UIButton!
    @IBOutlet weak var Holebtn3:UIButton!
    @IBOutlet weak var Holebtn4:UIButton!
    @IBOutlet weak var Holebtn5:UIButton!
    
    
    
    //MODE CHANGE
    @IBAction func Hardmode(_ sender: UIButton) {
    }
    @IBAction func Normalmode(_ sender: UIButton) {
    }
    @IBAction func Easymode(_ sender: UIButton) {
    }
    
    
    
    //CATCH button
    @IBAction func FrogHole1(_ sender: UIButton) {
        var elap = 0.0
        //game 진행여부
        if elapsedTime != 0.0{
            if sender.currentTitle == "x"{ // 성공적으로 잡을 경우
                FrogCounter += 1
                elapsedTime += 3.0
            }else{
                // 비활성
            }
            
        }
    }
    @IBAction func FrogHole2(_ sender: UIButton) {
    }
    @IBAction func FrogHole3(_ sender: UIButton) {
    }
    @IBAction func FrogHole4(_ sender: UIButton) {
    }
    @IBAction func FrogHole5(_ sender: UIButton) {
    }
    
    
    
    //Rank Label
    @IBOutlet var Rank1: UILabel!
    @IBOutlet var Rank1Score: UILabel!
    @IBOutlet var Rank2: UILabel!
    @IBOutlet var Rank2Score: UILabel!
    @IBOutlet var Rank3: UILabel!
    @IBOutlet var Rank3Score: UILabel!

}


