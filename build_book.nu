
# [ ] parse .vuepress/configs/sidebar/en.ts to get the object
# / replacesinglequote with double quotes
# parse json
def test [a] {
	# echo 's'
	cat .vuepress/configs/sidebar/en.ts
}


# let toc = (cat toc.json | from json)./book/

# echo $toc
# what isthe diff between this and (proc)

def data [] {
	let json = cat .vuepress/configs/sidebar/en.ts | parse -r 'sidebarEn: SidebarConfig = ([\s\S]*);'
	$json.capture0.0 | str replace --all "'" "\"" | from json
}

def flatten1 [t: table] {
	let table = $t | default [] children | select link children
	$table | each {|it| ($it | get link) | append ($it | get children )} | flatten
}

# $parsed./book/ | get link
let parsed = data

# let table = $parsed./book/ | default [] children | select link children
# let flat = $table | each {|it| ($it | get link) | append ($it | get children )} | flatten

# echo $flat
let links = flatten1 $parsed./book/ 
echo $links