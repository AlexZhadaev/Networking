//
//  CoursesTableViewCell.swift
//  Networking
//
//  Created by Жадаев Алексей on 14.08.2021.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var lessonsNumber: UILabel!
    @IBOutlet weak var testsNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
