require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 

if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "入力したらCtrl+Dをおしてください"
    memo = STDIN.readlines
    
    CSV.open('file_name.csv','a+') do |csv|
        csv << memo
    end
    
elsif memo_type == 2
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    CSV.open("file_name.csv", "a+") do |io|
    while line = io.gets
        puts line
    end
    end
    puts "入力したらCtrl+Dをおしてください"
    memo = STDIN.readlines
    CSV.open('file_name.csv','a+') do |csv|
        csv << memo
    end

else
    puts "1か2を入力してください"
end    