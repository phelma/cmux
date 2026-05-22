extension AppDelegate {
    func performEqualizeSplitsShortcut() {
        guard let tabManager, let workspace = tabManager.selectedWorkspace else {
#if DEBUG
            cmuxDebugLog("shortcut.action name=equalizeSplits result=noWorkspace")
#endif
            return
        }
#if DEBUG
        cmuxDebugLog("shortcut.action name=equalizeSplits workspaceId=\(workspace.id)")
#endif
        if shouldSuppressSplitShortcutForTransientTerminalFocusState(tabManager: tabManager) {
            return
        }
        let didEqualize = tabManager.equalizeSplits(tabId: workspace.id)
#if DEBUG
        if !didEqualize {
            cmuxDebugLog("shortcut.action name=equalizeSplits result=noSplitOrFailed workspaceId=\(workspace.id)")
        }
#endif
    }

    func performMakeSplitWiderShortcut(tabManager overrideTabManager: TabManager? = nil) {
        guard let tabManager = overrideTabManager ?? tabManager,
              let workspace = tabManager.selectedWorkspace else {
#if DEBUG
            cmuxDebugLog("shortcut.action name=makeSplitWider result=noWorkspace")
#endif
            return
        }
#if DEBUG
        cmuxDebugLog("shortcut.action name=makeSplitWider workspaceId=\(workspace.id)")
#endif
        if shouldSuppressSplitShortcutForTransientTerminalFocusState(tabManager: tabManager) {
            return
        }
        let didResize = tabManager.makeFocusedSplitWider()
        if !didResize {
            NSSound.beep()
        }
#if DEBUG
        if !didResize {
            cmuxDebugLog("shortcut.action name=makeSplitWider result=resizeFailed workspaceId=\(workspace.id)")
        }
#endif
    }

    func performMakeSplitNarrowerShortcut(tabManager overrideTabManager: TabManager? = nil) {
        guard let tabManager = overrideTabManager ?? tabManager,
              let workspace = tabManager.selectedWorkspace else {
#if DEBUG
            cmuxDebugLog("shortcut.action name=makeSplitNarrower result=noWorkspace")
#endif
            return
        }
#if DEBUG
        cmuxDebugLog("shortcut.action name=makeSplitNarrower workspaceId=\(workspace.id)")
#endif
        if shouldSuppressSplitShortcutForTransientTerminalFocusState(tabManager: tabManager) {
            return
        }
        let didResize = tabManager.makeFocusedSplitNarrower()
        if !didResize {
            NSSound.beep()
        }
#if DEBUG
        if !didResize {
            cmuxDebugLog("shortcut.action name=makeSplitNarrower result=resizeFailed workspaceId=\(workspace.id)")
        }
#endif
    }
}
