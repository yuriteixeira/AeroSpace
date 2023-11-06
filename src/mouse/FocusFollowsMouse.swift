struct FocusFollowsMouse {
    private static var mouseMovementMonitor: Any? = nil
    private static var currentWindowId: UInt? = nil

    static func enable() {
        mouseMovementMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { event in
            check(Thread.current.isMainThread)
            // todo floating windows
            focusedWindow

            mouseLocation.findIn(tree: mouseLocation.monitorApproximation.activeWorkspace.rootTilingContainer)

        }
        check(mouseMovementMonitor != nil)
    }

    static func disable() {
        if let mouseMovementMonitor {
            NSEvent.removeMonitor(mouseMovementMonitor)
        }
        mouseMovementMonitor = nil
    }
}
