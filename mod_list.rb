
chatgpt_question = eval(ARGV[0].to_s) or true

input = File.read("youtube_univ_title_list_20230325.txt")
count = input.split('<br/>').length
puts "合計動画タイトル数: #{count}"
if chatgpt_question
  puts
  puts "="*20 + " 以下chatGPTに入力 " + "="*20
  puts
end

input.split('<br/>').each_with_index do |line, i|
  if chatgpt_question
    if i%40==0
      puts
      puts "以下は動画の、タイトル、年代、視聴回数、のリストです。
動画タイトルから動画内容を類推して動画を分ける2,3個の分野（テーマ）を簡単なわかりやすい言葉でリストしてください。さらに、各分野の総動画タイトル数と合計視聴回数もつけてリストしてください。分野に含まれる動画タイトルは出力しないでください。"
      puts
    end
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

if chatgpt_question
  puts
  puts "今まで覚えた全ての動画タイトル数はいくつですか？"
  puts
  puts "さらに、今まで覚えた動画タイトルから動画内容を類推して動画を分ける10分野（テーマ）を簡単なわかりやすい言葉でリストしてください。さらに、合計視聴回数が多い順に分野リストを並べて、各分野の総動画タイトル数と合計視聴回数もつけてリストしてください。"
end
