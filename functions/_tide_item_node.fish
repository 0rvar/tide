function _tide_item_node
    # Return if node is not installed (eg Bun)
    command -v node > /dev/null || return
    if path is $_tide_parent_dirs/package.json
        node --version | string match -qr "v(?<v>.*)"
        _tide_print_item node $tide_node_icon' ' $v
    end
end
