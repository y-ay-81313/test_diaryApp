//
//  DiaryCell.swift
//  test
//
//  Created by ay on 2022/10/03.
//

import UIKit

class DiaryCell: UITableViewCell
{
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var week: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var imagecat: UIImageView!



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "DiaryCellId")
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
