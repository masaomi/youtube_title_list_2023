# 必要なライブラリを読み込む
library(ggplot2)
library(dplyr)

# データフレームを作成
data <- data.frame(
  Category = c("エンターテインメント・文化", "政治・経済・社会問題", "歴史・哲学・文学", "ビジネス・キャリア・自己啓発", "ライフスタイル・教育・健康", "国際政治・地政学", "仮想通貨・ブロックチェーン・Web3.0", "コミュニケーション・人間関係", "インタビュー・対談", "漫画・アニメ関連"),
  TotalViews = c(52419750, 51964963, 50991428, 47885124, 26368516, 25099345, 5223775, 8604970, 6961740, 1919840),
  AvgViews = c(534895, 399730, 432119, 563354, 527370, 597603, 474888, 537810, 278469, 479960)
)

# 合計視聴回数の多い順に並べ替え
data <- data %>% arrange(desc(TotalViews))

# 棒グラフをプロット
p <- ggplot(data) +
  geom_col(aes(x = reorder(Category, -TotalViews), y = TotalViews, fill = "合計視聴回数"), position = position_nudge(x = -0.2), width = 0.4) +
  geom_col(aes(x = reorder(Category, -TotalViews), y = AvgViews * 100, fill = "平均視聴回数"), position = position_nudge(x = 0.2), width = 0.4) +
  scale_y_continuous(limits = c(0, 6e+7), sec.axis = sec_axis(~./100, name = "平均視聴回数")) +
  labs(
    title = "Youtube大学各分野の合計視聴回数と平均視聴回数",
    x = "分野",
    y = "合計視聴回数"
  ) +
  theme_bw(base_family = "HiraKakuProN-W3") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "bottom",
    legend.title = element_blank()
  )

print(p)
