



import Foundation


class MainPagePresenter {

    weak private var mainPageInputDelegate: MainPageInputDelegate?
    var icons = ContentIcons.icons
    
    func setMainPageIputDelegate(mainPageInputDlegate: MainPageInputDelegate) {
        self.mainPageInputDelegate = mainPageInputDlegate
    }
    
    private func loadIcons() {
        self.mainPageInputDelegate?.setupContent(with: self.icons)
    }
    
    
}

extension MainPagePresenter: MainPageOutputDelegate {
    func getIcons() {
        self.loadIcons()
    }
}
