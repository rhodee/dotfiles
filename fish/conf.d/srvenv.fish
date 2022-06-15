function srcenv
	for i in (sed 's/=/ /' $argv)
		set arr (echo $i | tr ' ' \n)
		set -gx $arr[1] $arr[2]
	end
end
