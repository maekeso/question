#!/usr/local/bin/ruby
require 'natto'


text = "走る人は美しい"#ここにふりがなをふりたいテキストを入力
natto = Natto::MeCab.new




natto.parse(text) do |n|
origin =n.surface

if origin != ""

num=n.feature.split(',').count#
num2=n.surface.split(',').count
  if(num>7)
      kana=n.feature.split(',')[7].tr("ァ-ン","ぁ-ん")
  else
    kana=origin
  end

if origin == kana
  print n.surface


else





num=kana.split(//).count
num2=origin.split(//).count

a=kana.split(//)#ふりがなを分解　はしる　3
b=origin.split(//)#文字を分解　走る 2


#走はし　る

if  a[num-1]==b[num2-1] && a[num-2]==b[num2-2]

okurikana=a[num-2]+a[num-1]

a[num-1]=""
a[num-2]=""
b[num2-1]=""
b[num2-2]=""
kana=""
origin=""

for c in b
 origin+=c
end

for c in a
kana+=c
end


elsif a[num-1] == b[num2-1]
  okurikana=a[num-1]
  a[num-1]=""
  b[num2-1]=""

origin=""
kana=""
for c in b
 origin+=c
end


for c in a
  kana+=c
end



end


print "<ruby><rb>#{origin}<rb><rt>#{kana}</rt></ruby>"
print okurikana



end
end
end
