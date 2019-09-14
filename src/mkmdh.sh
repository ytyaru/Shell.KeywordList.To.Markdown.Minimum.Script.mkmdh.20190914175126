# $1: キーワードリスト
# 結果: * [キーワード](#キーワード)
_mklist() { echo "$1" | sed -r "s/^(\w+)$/* [\1](#\1)/g"; }
# $1: キーワードリスト
# 結果: <a name="キーワード"></a>
_mkanchor() { echo "$1" | sed -r "s/^(\w+)$/<a name=\"\1\"><\/a>/g"; }
# $1: キーワードリスト
# 結果: ## [キーワード](#キーワード)
_mkh2() { echo "$1" | sed -r "s/^(\w+)$/## [\1](#\1)/g"; }
# mkmdh
# $1: キーワードリスト
# 結果: markdownのアンカーを量産する
# * [キーワード](#キーワード)
# ...
# <a name="キーワード"></a>
# ## [キーワード](#キーワード)
# ...
run() {
	local list="`_mklist "$1"`"
	local anchor="`_mkanchor "$1"`"
	local h2="`_mkh2 "$1"`"
	local anch2="`paste -d'\n' <(echo "$anchor") <(echo "$h2")`"
	echo "$list"
	echo "$anch2"
}
run "`cat`"

