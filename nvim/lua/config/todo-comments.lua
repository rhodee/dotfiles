local todo_comments = require('todo-comments')

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