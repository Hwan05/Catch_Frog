//
//  ViewController.swift
//  Catch_Frog
//
//  Created by Hwan의 MacBook Pro on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HoleButtonArray = [Holebtn1,Holebtn2,Holebtn3,Holebtn4,Holebtn5]
        ranknameArray = [Rank1,Rank2,Rank3]
        rankscoreArray = [Rank1Score,Rank2Score,Rank3Score]
  


        //rankscoreArray
        
        func Nextgame (){
            FrogCounter = 0
            FrogCount.text = String(FrogCounter)
            Time.text = "0"
        }
        func RankUpdate(_ FrogCatchCount:Int){
            while true  {
                var count = 0
                if rankscores.isEmpty {
                    rankscores.append(FrogCount.text)
                    break
                }
                if FrogCatchCount > Int(rankscoreArray[count].text!)!{
                    }
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
    var rankscoreArray:Array<UILabel> = []
    var ranknameArray:Array<UILabel> = []
    var rankscores:Array<Int> = []
    
    
    //RESTART
    @IBAction func Restart(_ sender: UIButton) {
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
    
    
    
    //CATCH
    @IBAction func FrogHole1(_ sender: UIButton) {
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

