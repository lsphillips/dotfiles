import-module posh-git

oh-my-posh init pwsh --config $env:HOMEPATH\oh-my-posh.json | iex
$env:POSH_GIT_ENABLED = $true

function ..
{
	cd ..
}

function home
{
	cd $env:HOMEPATH
}

function downloads
{
	cd $env:HOMEPATH\Downloads
}

function hosts
{
	code $env:SystemRoot\System32\Drivers\etc\hosts
}

function ps-profile
{
	code $PROFILE
}

function aws-config
{
	code $env:HOMEPATH\.aws
}

function delete
{
	rm -Recurse $args
}

function flush-dns
{
	ipconfig /flushdns
}

function update
{
	param (
		[switch]
		$help = $false
	)

	winget upgrade --all -s winget
	update-module -Force

	if ($help)
	{
		update-help
	}
}

function empty-bin
{
	(New-Object -ComObject Shell.Application).Namespace(0xA).Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
}

function aws-profiles
{
	aws configure list-profiles
}
