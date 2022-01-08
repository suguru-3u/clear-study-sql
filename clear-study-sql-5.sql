-- このファイルはスッキリSQLの第五章の問題を勉強した際のメモと問題の解答です。
-- ・case文
-- case 評価する式　when 値 then 値だった場合に返す値
--  	 			else デフォルト値
-- End


-- case when 条件 then 条件だった場合に返す値
--  	 			else デフォルト値
-- End

-- ・関数
--  LENGTH(引数)
--  文字列の数を返却する

-- ・ユーザー定義関数
-- 　関数を自分で作るもの

-- ・ストアドブロシーシャ
-- 　実行するSQLをまとめDB内に保存し、DBの外側から呼び出すもの

-- ・trim

--  ・REPLACE

-- ・substring

-- ・concat (対象の文字列, ‘’ || ‘’)

-- ・Round(切り上げ)

-- ・TRUNC(切り捨て)

-- ・POWER(べき乗)

-- ・current_date(日付の取得)
-- 　current_time(自国の取得)

-- ・cast(変換する値 AS 変換する型)
-- 　型変換

-- ・COALESCE
-- 　最初に登場するNULLでない値を返す
-- 　NULLの場合の代替値


-- 問題1
-- ①
update 試験結果
set = (80 * 4 - (午前 + 午後2 + 論述)
where 受験者ID = SW1046

-- ②
select 受験者ID AS 合格者ID
from 試験結果
where
午前 >= 60 and (午後1 + 午後2) >= 120
	and 論述 >= (平均点 * 4 * 0.3)

-- 問題2
-- ①
update 回答者
set 国名 = 
    case 
        when substring(メールアドレス,LENGTH(メールアドレス) - 3 , 2) = jp then '日本'
        when substring(メールアドレス,LENGTH(メールアドレス) - 3 , 2) = uk then 'イギリス'
        when substring(メールアドレス,LENGTH(メールアドレス) - 3 , 2) = cn then '中国'
        when substring(メールアドレス,LENGTH(メールアドレス) - 3 , 2) = fr then 'フランス'
        when substring(メールアドレス,LENGTH(メールアドレス) - 3 , 2) = vn then 'ベトナム'
    end

-- ②
select trim(メールアドレス),
    case 
        when 年齢 >= 50 then 50代
        when 年齢 >= 40 then 40代
        when 年齢 >= 30 then 30代
        when 年齢 >= 20 then 20代
    end
    || ':' ||
    case 
        when 性別 = 'M' then 男性
        when 性別 = 'F' then 女性
    end
    AS 属性

-- 問題3
-- ①
update 受注
set 文字数 = LENGTH(trim(文字))

-- ②
select 受注日, 受注ID, 文字数, 書面体, 
    case
        when 書体コード = 1 then 100
        when 書体コード = 2 then 150
        when 書体コード = 3 then 200
        else 100
    end 
    AS 単価,
    case
        when 文字数 >= 10 then 500
        else 0
    end
    AS 特別加工量

from 受注

-- ③
update 受注
set 文字 = splace(文字 ,' ' , 乾)
where 受注ID = 113

