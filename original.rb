def update(book, key, value)
  book[key] = value
  book
end

book = {title: "A", auther: "aaa", published_at: "1990-4-20"}
puts book

new_book = update(book, :auther, "bbb")

puts new_book