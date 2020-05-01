
import UIKit

extension OutlineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell", for: indexPath)
        let textView = cell.viewWithTag(1001) as! UITextView
        cell.selectionStyle = .none
        textView.delegate = self
        return cell
    }
}

extension OutlineViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // 刷新高度，解决跳动问题
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(false)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}
