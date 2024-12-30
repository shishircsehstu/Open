

import UIKit

class DowloadViewController: UIViewController {
    
    @IBOutlet weak var popUpViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var popUpViewContainer: UIView!
    @IBOutlet weak var popupView: PopupView!
    
    let height = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.delegate = self
        popupView.itemsArray = ["AAA","BBB","CCC","DDD","EEE"]
        self.popUpViewContainer.isHidden = true
        hideDownloadView()
        addTapGestureForHideView()
    }
    
    @IBAction func presntPopupView(_ sender: Any) {
        showDownlodView()
    }
    
}

// MARK: - popup view show or hide

extension DowloadViewController {
    
    func addTapGestureForHideView() {
        // Create a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideView))
        
        // Add the gesture recognizer to the view
       // popUpViewContainer.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideView() {
       // hideDownloadView()
    }
    
    func showDownlodView() {
        
        popUpViewContainer.isHidden = false
        
        UIView.animate(withDuration: 0.4) {
            self.popUpViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    func hideDownloadView() {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.popUpViewBottomConstraint.constant = -(self.popupView.frame.height)
            self.view.layoutIfNeeded()
        }) { _ in
            self.popUpViewContainer.isHidden = true
        }
    }
}
// pop up delegate mehtod
extension DowloadViewController: PopupViewDelegate {
    func dismissPopUpview() {
        hideDownloadView()
    }
    
    func getSelectedItm(indexPath: IndexPath) {
        print(indexPath.row)
    }
    func downloadBtnPressed(){
        print("Download now")
    }
}
