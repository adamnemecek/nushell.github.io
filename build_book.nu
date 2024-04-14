
# [ ] parse .vuepress/configs/sidebar/en.ts to get the object
# / replacesinglequote with double quotes
# parse json
def test [a] {
	# echo 's'
	cat .vuepress/configs/sidebar/en.ts
}

def get-data [] {
	let json = cat .vuepress/configs/sidebar/en.ts | parse -r 'sidebarEn: SidebarConfig = ([\s\S]*);'
	$json.capture0.0 | str replace --all "'" "\"" | from json
}

def flatten1 [t: table] {
	let table = $t | default [] children | select link children
	# $table | each {|it| ($it | get link) | append ($it | get children )} | flatten
	# $table | each {|it| $it.link | append $it.children} | flatten
	$table | each {|it| $it.link ++ $it.children} | flatten 
}

let parsed = get-data

# echo $flat
let links = flatten1 $parsed./book/ 
let stripped = $links | each {|x| $x | split column "/"  | get column3 } | flatten
let files = $stripped | str join ' '


# echo $"($files)"
# echo $"pandoc ($files) -o book.pdf"
echo $"pandoc ($files) -o book.typ"

# typst compile book.typ book.pdf

# replace images
