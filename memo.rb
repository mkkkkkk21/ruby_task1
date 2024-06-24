require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

while true
    memo_type = gets.to_i 
    if memo_type == 1
        puts "新規のファイル名を入力してください"
        file_title = gets.chomp
        puts "メモしたい内容を入力してください Ctrl+Dで保存します"
        memo_content = readlines.map(&:chomp)
        CSV.open("#{file_title}.csv",'w') do |new_csv|
        new_csv << memo_content
        end
        break
    elsif memo_type == 2
        puts "編集したいファイル名を入力してください"
        file_title = gets.chomp
        puts "メモに追記したい内容を入力してください Ctrl+Dで保存します"
        memo_content = readlines.map(&:chomp)
        CSV.open("#{file_title}.csv",'a') do |csv|
        csv << memo_content
        end
        break
    else 
        puts "1か2を入力してください"
    end
end


