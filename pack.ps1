cd ./publish

$publish_list = @('linux-x64', 'linux-arm64', 'linux-musl-x64', 'osx-x64', 'osx-arm64', 'win-x64')

foreach ($item in $publish_list) {
	$dirname = "fastgithub_$item"
	(test-path "$dirname/logs") ? (rm "$dirname/logs" -recurse) : (echo "")
	tar -zcf "$dirname.tar.gz" "$dirname"
	if ($lastexitcode -eq 0){
		write-host "$dirname compress successful." -ForegroundColor Green
	}
	else {
		write-host "$dirname compress failed." -ForegroundColor Red
	}
}
