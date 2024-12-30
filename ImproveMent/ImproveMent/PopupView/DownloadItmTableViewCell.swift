

import UIKit


class DownloadItmTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    var selectedIndexPath = IndexPath(row: 0, section: 0)
    var itemsArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius=10
        containerView.layer.borderWidth = 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCell(indexPath: IndexPath){
        
        descriptionLbl.text = itemsArray[indexPath.row]
        if selectedIndexPath ==  indexPath {
            containerView.layer.borderColor = UIColor(named: "5ftfr")?.cgColor
        }else {
            containerView.layer.borderColor = UIColor.clear.cgColor
            
        }
    }
    
}
