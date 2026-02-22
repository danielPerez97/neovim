return {
    cmd = {"xcrun", "sourcekit-lsp"},
    filetypes = {"swift", "objective-c", "objective-cpp"},
    root_markers = {
        "buildServer.json", "Package.swift", "*.xcodeproj", "*.xcworkspace"
    }
}
