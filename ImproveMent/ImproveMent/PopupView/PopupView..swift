
import Foundation
import UIKit

class PopupView: UIView {
    
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var downloadTableView: UITableView!
    var downloadSelectedIndex = IndexPath(row: 0, section: 0)
    var delegate: PopupViewDelegate!
    var itemsArray = ["A","B","c",
                      "abc   t "]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: PopupView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadTableViewNib()
        
    }
    func loadTableViewNib() {
        
        downloadTableView.register(UINib(nibName: "DownloadItmTableViewCell", bundle: nil), forCellReuseIdentifier: "DownloadItmTableViewCell")
        downloadTableView.dataSource = self
        downloadTableView.delegate = self
        downloadTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        downloadTableView.separatorStyle = .none
        
        
    }
    
    @IBAction func dismissPopUpviewAction(_ sender: Any) {
        delegate.dismissPopUpview()
    }
    
    @IBAction func downloadBtnPressed(_ sender: Any) {
        delegate.downloadBtnPressed()
    }
}
// MARK: - For download table view cell
extension PopupView: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = downloadTableView.dequeueReusableCell(withIdentifier: "DownloadItmTableViewCell") as! DownloadItmTableViewCell
        
        cell.itemsArray = itemsArray
        cell.selectedIndexPath = downloadSelectedIndex
        cell.loadCell(indexPath: indexPath)
        
        cell.selectionStyle = .none
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        downloadSelectedIndex = indexPath
        downloadTableView.reloadData()
        delegate.getSelectedItm(indexPath: indexPath)
    }
}

protocol PopupViewDelegate: AnyObject {
    func getSelectedItm(indexPath: IndexPath)
    func dismissPopUpview()
    func downloadBtnPressed()
}

extension PopupViewDelegate {
    func downloadBtnPressed () {
        print("Download protol func call")
    }
}
