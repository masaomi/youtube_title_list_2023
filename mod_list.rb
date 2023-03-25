
input = File.read("youtube_univ_title_list_20230325.txt")
input.split('<br/>').each_with_index do |line, i|
  if i%40==0 and i==0
    puts "以下は動画の、タイトル、年代、視聴回数、のリストです。覚えてください。今回は返答はいりませんが覚えた動画タイトル数だけ教えてください。"
    puts
  elsif i%40==0
    puts
    puts "以下同様に動画の、タイトル、年代、視聴回数、のリストです。覚えてください。今回も返答はいりませんが覚えた合計動画タイトル数だけ教えてください。"
    puts
  end
  row = []
  title = line.split(/作成者/).first.gsub(/】/, '').gsub(/【/, '').strip
  date = line[/NAKATA UNIVERSITY\s+(\d+)\s+.+前/].to_s.gsub(/NAKATA UNIVERSITY/,'').strip
  views = line[/(\d+,?\d+ 回視聴)/].to_s.gsub(/回視聴/,'')
  row << title
  row << date
  row << views
  puts row.join("\t")
end

puts
puts "今まで覚えた全ての動画タイトル数はいくつですか？"
puts
puts "さらに、今まで覚えた動画タイトルから動画内容を類推して動画を分ける10分野（テーマ）を簡単なわかりやすい言葉でリストしてください。さらに、合計視聴回数が多い順に分野リストを並べて合計視聴回数もつけてリストしてください。"
