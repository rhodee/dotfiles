function does_exist(path)
    return not (vim.fn.empty(vim.fn.glob(path)) > 0)
end

return {
    does_exist = does_exist,
}