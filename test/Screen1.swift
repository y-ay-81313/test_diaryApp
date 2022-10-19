//
//  Screen1.swift
//  test
//
//  Created by ay on 2022/09/30.
//

import UIKit

class Screen1: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    /*
    @IBOutlet weak var label1: UILabel!
    @IBAction func button1Click(_ sender: Any) {
        label1.text = "ボタン１が押されたよ！"
    }
    */
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Diary {
        var month: Int
        var day: Int
        var week: Int
        var subject: String
        var imagePath: String
    }
    
    var diarys = [Diary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.rowHeight = 90
        
        //DBから日記データを取得
        //.......
        /* for(){
            self.diarys.append(Diary(month: db_month, day: db_day, week: db_week, subject: db_subject, imagePath: db_image_path))
         }
         */
        self.diarys.append(Diary(month: 6, day: 4, week: 2, subject: "誕生日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 10, week: 2, subject: "結婚記念日", imagePath: "../image.png"))
        self.diarys.append(Diary(month: 6, day: 15, week: 2, subject: "誕生日", imagePath: "../image.png"))
        
    }
        //リストひとつ分の高さのサイズを設定
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //リスト表示するセルの個数を返す
        //例えば、5日分のデータならreturn 5
        return self.diarys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

   
        let diaryCell = tableView.dequeueReusableCell(withIdentifier: "DiaryCellId", for: indexPath) as! DiaryCell
        
        
        
        diaryCell.month.text = String(self.diarys[indexPath.row].month)
        diaryCell.day.text = String(self.diarys[indexPath.row].day)
        diaryCell.subject.text = String(self.diarys[indexPath.row].subject)
        diaryCell.week.text = String(self.diarys[indexPath.row].week)

        //表示するセルの内容を設定する
        //例えば、diaryCell.month.text = "12"
        
        
        return diaryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Screen2Id") as! Screen2
    
            
        self.present(vc, animated: true)
    
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
     
    }
}
