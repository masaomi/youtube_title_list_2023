
input = File.read("youtube_univ_title_list_20230325.txt")
input.split('<br/>').each do |line|
  row = []
  title = line.split(/作成者/).first.gsub(/】/, '').gsub(/【/, '').strip
  date = line[/NAKATA UNIVERSITY\s+(\d+)\s+.+前/].to_s.gsub(/NAKATA UNIVERSITY/,'').strip
  views = line[/(\d+,?\d+ 回視聴)/].to_s.gsub(/回視聴/,'')
  row << title
  row << date
  row << views
  puts row.join("\t")
end

