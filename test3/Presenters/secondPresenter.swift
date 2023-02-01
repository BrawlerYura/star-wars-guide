



import Foundation


class SecondPresenter {

    weak private var secondInputDelegate: SecondInputDelegate?
    var icons = ContentIcons.icons
    
    func setSecondIputDelegate(secondInputDlegate: SecondInputDelegate) {
        self.secondInputDelegate = secondInputDlegate
    }
    
    private func loadIcons() {
        self.secondInputDelegate?.setupContent(with: self.icons)
    }
    
    
}

extension SecondPresenter: SecondOutputDelegate {
    func getIcons() {
        self.loadIcons()
    }

    func saveChoosedContentType(choosedContentType: String) {
        selectChoosedContentType(choosedContentType: choosedContentType)
    }

}
