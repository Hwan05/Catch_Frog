//
//  ViewController.swift
//  Catch_Frog
//
//  Created by Hwan의 MacBook Pro on 2021/09/16.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    //DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sbenable.isEnabled = false
        let ad = UIApplication.shared.delegate as? AppDelegate
        Huntername.text = ad?.paramname
        HoleButtonArray = [Holebtn1,Holebtn2,Holebtn3,Holebtn4,Holebtn5]
        frogimage = [UIImage(named: "frog1.png")!,UIImage(named: "frog2.png")!,UIImage(named: "frog3.png")!,UIImage(named: "frog4.png")!,UIImage(named: "frog5.png")!] // frog 이미지들
    
        rankNameUIArray = [Rank1,Rank2,Rank3]
        rankScroeUIArray = [Rank1Score,Rank2Score,Rank3Score]
    }


    
    //게임 시작
    var frogtimer:Timer?
    func start() {
        gameonoff = true
        timerstart()
        frogtimer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(ViewController.frog), userInfo: nil, repeats: true)
    }

    // 개구리 배치 패턴
    @objc func frog(){
        print("개구리배치") // output 확인용
        
        
        // frog 5 hole random on
        var random = Int(arc4random() % 5)
        // 0~3초이내 + 0.?? 초
        let randomtime:Double = Double(arc4random_uniform(3)) + drand48()
        
        let randomcount = Int(arc4random() % 2)
        
        for _ in 0..<randomcount {
            if self.HoleButtonArray[random].currentTitle == "x"{
                continue
            }
            Timer.scheduledTimer(withTimeInterval: randomtime, repeats: false){ (timer) in
                self.HoleButtonArray[random].setTitle("x", for: UIControl.State.normal) // frog Catchon  = button title "X"
                self.HoleButtonArray[random].setImage(self.frogimage[random], for: .normal)
                
            }
            if random == 4 {
                random = random - 4
            }else{
                random = random + 1
            }
        }
 

        
            
        // frog off timer
        Timer.scheduledTimer(withTimeInterval: randomtime, repeats: false){ (timer) in
            print("개구리배치끝") // output 확인용
            // 이미 개구리를 잡은 경우
            if self.HoleButtonArray[random].currentTitle != "x"  {
                self.HoleButtonArray[random].setTitle(String(random+1), for: UIControl.State.normal)
                self.HoleButtonArray[random].setImage(UIImage(named:""), for: .normal)
            }
        }
        
        // timeover game off
        if elapsedTime <= 0 {
            frogtimer?.invalidate()
            frogtimer = nil
            RankUpdate()
            print("게임 종료")
        }
    }
    
    // 게임 초기화
    func Nextgame (){
        gameonoff = false
        sbenable.isEnabled = true
        startcount = 5
        FrogCounter = 0
        FrogCount.text = String(format: "%d",FrogCounter) // 잡은 수 초기화
        elapsedTime = 30 // 남은시간 30초
        Time.text = String(format: "%d", elapsedTime)
    }
    
    //Rank 갱신 미구현
    func RankUpdate(){
        // 랭킹이 비어있는 경우, 아닌 경우
        if ranknameArray.isEmpty {
            ranknameArray.append(Huntername.text!)
            rankscoreArray.append(FrogCounter)
            rankNameUIArray[0].text = ranknameArray[0]
            rankScroeUIArray[0].text = String(rankscoreArray[0])
        }
        else{
            var count:Int = 0 // 배열 시퀸스
            for i in rankscoreArray {// 저장된 배열 길이만큼 확인
                if FrogCounter > i {
                    rankscoreArray.insert(FrogCounter, at: count)
                    ranknameArray.insert(Huntername.text!, at: count)
                }
                //갱신
                rankNameUIArray[count].text = ranknameArray[count]
                rankScroeUIArray[count].text = String(rankscoreArray[count])
                count += 1
            }
        }
//
//        rankNameUIArray[i].text = ranknameArray[i]
//        rankScroeUIArray[i].text = String(rankscoreArray[i])
    }
    
    /// 메인 제한 시간
    var maintime:Timer?
    func timerstart() {
    maintime =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: timeSelection, userInfo: nil, repeats: true) //timer,시간간격,동작될 뷰 , 타이머가 구동될 때 실행할 함수 , 사용자 정보, 반복여부
    }
    let timeSelection:Selector = #selector(ViewController.updateTime)
    
    //반복실행 함수
    @objc func updateTime(){
        elapsedTime = elapsedTime - 1
        Time.text = String(elapsedTime)
        print("check 실행")
        if elapsedTime <= 0 {
            maintime?.invalidate()
            maintime = nil
            RankUpdate()
        }
    }
    
    //--------------------------------------------------------
    
    
    @IBOutlet var sbenable: UIButton!
    var startcount = 5
    @IBAction func sb(_ sender: UIButton) {
        if gameonoff == false {
            sbenable.isEnabled = false
            startLabel.text = String(startcount)
            maintime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startcounter), userInfo: nil, repeats: true)
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                self.start()
            }
           
        }
    }
    @objc func startcounter(){
        if startcount != 0 {
            startcount = startcount - 1
            startLabel.text = String(startcount)
        }else { startLabel.text = "START !"
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false ) { _ in
                self.startLabel.text = ""
            }
        }
    }
    
    //--------------------------------------------------------
    
    // Object
    var hunter:String = "Hunter name" // default name
    
    var rankNameUIArray:Array<UILabel> = []
    var rankScroeUIArray:Array<UILabel> = []
    
    var gameonoff = false // game start true:false
    var HoleButtonArray: Array<UIButton> = [] // button state save
    
    var rank:Array<String> = [] // 랭크 저장용
    var FrogCounter = 0 // 잡은 개구리수
    var StartTime:Data = Data() // 현재 시간정보
    var elapsedTime = 0 // 남은 시간
    
    // 랭킹관련
    var rankscoreArray:Array<Int> = []
    var ranknameArray:Array<String> = []
    
    // 번호별 frog이미지
    var frogimage:Array<UIImage> = []
    
    
    //RESTART BUTTON
    @IBAction func Restart(_ sender: UIButton) {
        if elapsedTime <= 0 { // 게임종료여부
            Nextgame()
        }else{
            //gameonoff = false
            // 게임중단 승인
            //return notification
        }
    }
    
    // Label
    @IBOutlet weak var Huntername:UILabel!
    @IBOutlet weak var Modename:UILabel!
    @IBOutlet weak var FrogCount: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    
    // main frog button
    @IBOutlet weak var Holebtn1:UIButton!
    @IBOutlet weak var Holebtn2:UIButton!
    @IBOutlet weak var Holebtn3:UIButton!
    @IBOutlet weak var Holebtn4:UIButton!
    @IBOutlet weak var Holebtn5:UIButton!
    
    //start count viewLabel
    @IBOutlet var startLabel: UILabel!
    
    
    //MODE CHANGE BUTTON 미구현
    @IBAction func Hardmode(_ sender: UIButton) {
    }
    @IBAction func Normalmode(_ sender: UIButton) {
    }
    @IBAction func Easymode(_ sender: UIButton) {
    }
    
    
    //-------------------------------------------------------
    //CATCH BUTTON
    @IBAction func FrogHole1(_ sender: UIButton) {
        //game 진행여부
        if elapsedTime > 0 && gameonoff == true{
            if sender.currentTitle == "x"{ // 성공적으로 잡을 경우
                FrogCounter += 1
                FrogCount.text = String(FrogCounter)
                elapsedTime += 3
                Holebtn1.setTitle("1", for: .normal)
                Holebtn1.setImage(UIImage(named:""), for: .normal)
            }else{
                // 비활성
                Time.text = String(format: "\(elapsedTime) - %d초", 1)
                elapsedTime -= 1
            }
            
        }
    }
    @IBAction func FrogHole2(_ sender: UIButton) {
        //game 진행여부
        if elapsedTime > 0 && gameonoff == true{
            if sender.currentTitle == "x"{ // 성공적으로 잡을 경우
                FrogCounter += 1
                FrogCount.text = String(FrogCounter)
                elapsedTime += 3
                Holebtn2.setTitle("2", for: .normal)
                Holebtn2.setImage(UIImage(named:""), for: .normal)
            }else{
                // 비활성
                Time.text = String(format: "\(elapsedTime) - %d초", 1)
                elapsedTime -= 1
            }
            
        }
    }
    @IBAction func FrogHole3(_ sender: UIButton) {
        //game 진행여부
        if elapsedTime > 0 && gameonoff == true{
            if sender.currentTitle == "x"{ // 성공적으로 잡을 경우
                FrogCounter += 1
                FrogCount.text = String(FrogCounter)
                elapsedTime += 3
                Holebtn3.setTitle("3", for: .normal)
                Holebtn3.setImage(UIImage(named:""), for: .normal)
            }else{
                // 비활성
                Time.text = String(format: "\(elapsedTime) - %d초", 1)
                elapsedTime -= 1
            }
            
        }
    }
    @IBAction func FrogHole4(_ sender: UIButton) {
        //game 진행여부
        if elapsedTime > 0  && gameonoff == true{
            if sender.currentTitle == "x"{ // 성공적으로 잡을 경우
                FrogCounter += 1
                FrogCount.text = String(FrogCounter)
                elapsedTime += 3
                Holebtn4.setTitle("4", for: .normal)
                Holebtn4.setImage(UIImage(named:""), for: .normal)
            }else{
                // 비활성
                Time.text = String(format: "\(elapsedTime) - %d초", 1)
                elapsedTime -= 1
            }
            
        }
    }
    @IBAction func FrogHole5(_ sender: UIButton) {
        //game 진행여부
        if elapsedTime > 0 && gameonoff == true{
            if sender.currentTitle == "x"{ // 성공적으로 잡을 경우
                FrogCounter += 1
                FrogCount.text = String(FrogCounter)
                elapsedTime += 3
                Holebtn5.setTitle("5", for: .normal)
                Holebtn5.setImage(UIImage(named:""), for: .normal)
            }else{
                Time.text = String(format: "\(elapsedTime) - %d초", 1)
                elapsedTime -= 1
            }
        }
    }
    //-------------------------------------------------------
    
    
    //Rank Label
    @IBOutlet var Rank1: UILabel!
    @IBOutlet var Rank1Score: UILabel!
    @IBOutlet var Rank2: UILabel!
    @IBOutlet var Rank2Score: UILabel!
    @IBOutlet var Rank3: UILabel!
    @IBOutlet var Rank3Score: UILabel!

}


