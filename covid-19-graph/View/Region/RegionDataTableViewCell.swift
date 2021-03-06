//
//  RegionDataTableViewCell.swift
//  covid-19-graph
//

import Core
import UIKit

final class RegionDataTableViewCell: UITableViewCell {
    @IBOutlet private weak var prefectureName: UILabel!
    @IBOutlet private weak var primaryNumber: UILabel!
    @IBOutlet private weak var secondaryNumber: UILabel!
    @IBOutlet private weak var tertiaryNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setContent(prefecture: PrefectureModel) {
        prefectureName.text = prefecture.name.rawValue
        primaryNumber.text = prefecture.cases.toCommaSeperateString
        secondaryNumber.text = prefecture.hospitalize.toCommaSeperateString
        tertiaryNumber.text = prefecture.pcr.toCommaSeperateString
    }
}
