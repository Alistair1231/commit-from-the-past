# commit-from-the-past

![picture 1](https://i.imgur.com/2RxACiI.png)  

This script allows for easy commits with commit times as offset from current time. Either commit directly using this script, or use the `-a` flag to amend the last commit.  

This script is built using [*argbash*](https://github.com/matejak/argbash). To modify and build the script yourself, set up argbash and then compile like this:
```bash
argbash -o commit.sh commit.m4
```

## Usage

```
Usage: ./commit.sh [-H|--hours <arg>] [-d|--days <arg>] [-m|--message <arg>] [-a|--(no-)amend] [--(no-)test] [-h|--help]
        -H, --hours: commit time difference in hours (default: '0')
        -d, --days: commit time difference in days (default: '0')
        -m, --message: commit message, when used with --amend leave empty to keep message as is (no default)
        -a, --amend, --no-amend: apply time shift to last commit, or to specific commit using --amend-commit (off by default)
        --test, --no-test: only test, don't actually run (off by default)
        -h, --help: Prints help
```

## Example usage

commit changes with time offset of -2 days and -1 hours. Set commit message to "create_configuration fix"  
> `commit -d-2 -H-1 -m "create_configuration fix"`  

amend last commit and change commit time to +12 hours from now.  
> `commit -H "+12" -a`

## Some pictures 
![picture 6](https://i.imgur.com/pygvCF4.png)  
![picture 7](https://i.imgur.com/aCIoEuY.png)  
![pic 3](https://i.imgur.com/WPJ8Kt6.png)  