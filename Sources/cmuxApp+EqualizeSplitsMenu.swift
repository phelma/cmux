import SwiftUI

extension cmuxApp {
    func makeSplitWiderCommandButton() -> some View {
        splitCommandButton(title: String(localized: "command.makeSplitWider.title", defaultValue: "Make Pane Wider"), shortcut: menuShortcut(for: .makeSplitWider)) {
            let manager = activeTabManager
            if !manager.makeFocusedSplitWider() {
#if DEBUG
                if let workspace = manager.selectedWorkspace {
                    cmuxDebugLog("menu.makeSplitWider result=noHorizontalSplitOrFailed workspaceId=\(workspace.id)")
                } else {
                    cmuxDebugLog("menu.makeSplitWider result=noWorkspace")
                }
#endif
            }
        }
    }

    func equalizeSplitsCommandButton() -> some View {
        splitCommandButton(title: String(localized: "command.equalizeSplits.title", defaultValue: "Equalize Splits"), shortcut: menuShortcut(for: .equalizeSplits)) {
            let manager = activeTabManager
            if let workspace = manager.selectedWorkspace {
                let didEqualize = manager.equalizeSplits(tabId: workspace.id)
#if DEBUG
                if !didEqualize {
                    cmuxDebugLog("menu.equalizeSplits result=noSplitOrFailed workspaceId=\(workspace.id)")
                }
#endif
            }
        }
    }
}
