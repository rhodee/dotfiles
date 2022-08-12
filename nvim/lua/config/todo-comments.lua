local status, todo_comments = pcall(require, 'todo-comments')
if (not status) then return end

todo_comments.setup({
  merge_keywords = true,
  keywords = {
    WARNING = { icon = ' ', color = 'warning' },
  },
  highlight = {
    pattern = [[.*<(KEYWORDS)\s*]],
    keyword = 'bg',
    comments_only = true,
  },
  search = {
    pattern = [[\b(KEYWORDS)\b]],
  },
})